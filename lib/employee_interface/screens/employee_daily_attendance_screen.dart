import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeDailyAttendanceScreen extends StatefulWidget {
  const EmployeeDailyAttendanceScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDailyAttendanceScreenState createState() =>
      _EmployeeDailyAttendanceScreenState();
}

class _EmployeeDailyAttendanceScreenState
    extends State<EmployeeDailyAttendanceScreen> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? _clockInTime;
  TimeOfDay? _clockOutTime;
  final TextEditingController _breakDurationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _hasClockIn = false;
  bool _hasClockOut = false;

  Future<void> _selectTime(BuildContext context, bool isClockIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isClockIn) {
          _clockInTime = picked;
          _hasClockIn = true;
        } else {
          _clockOutTime = picked;
          _hasClockOut = true;
        }
      });
    }
  }

  void _submitAttendance() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement attendance submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Attendance submitted successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  String _formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return 'Not set';
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Attendance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today: ${DateFormat('EEEE, MMMM d, y').format(DateTime.now())}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clock In',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(_formatTimeOfDay(_clockInTime)),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: _hasClockIn
                                  ? null
                                  : () => _selectTime(context, true),
                              icon: const Icon(Icons.login),
                              label: const Text('Clock In'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clock Out',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(_formatTimeOfDay(_clockOutTime)),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: !_hasClockIn || _hasClockOut
                                  ? null
                                  : () => _selectTime(context, false),
                              icon: const Icon(Icons.logout),
                              label: const Text('Clock Out'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional Information',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _breakDurationController,
                          decoration: const InputDecoration(
                            labelText: 'Break Duration (minutes)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.timer),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final minutes = int.tryParse(value);
                              if (minutes == null || minutes < 0) {
                                return 'Please enter a valid duration';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _notesController,
                          decoration: const InputDecoration(
                            labelText: 'Notes/Remarks (Optional)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.note),
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _hasClockIn && _hasClockOut ? _submitAttendance : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Submit Attendance'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _breakDurationController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}