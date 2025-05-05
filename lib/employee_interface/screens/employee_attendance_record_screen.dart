import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecord {
  final DateTime date;
  final String status;
  final TimeOfDay? clockIn;
  final TimeOfDay? clockOut;
  final double hoursWorked;

  AttendanceRecord({
    required this.date,
    required this.status,
    this.clockIn,
    this.clockOut,
    required this.hoursWorked,
  });
}

class EmployeeAttendanceRecordScreen extends StatefulWidget {
  const EmployeeAttendanceRecordScreen({Key? key}) : super(key: key);

  @override
  _EmployeeAttendanceRecordScreenState createState() =>
      _EmployeeAttendanceRecordScreenState();
}

class _EmployeeAttendanceRecordScreenState
    extends State<EmployeeAttendanceRecordScreen> {
  List<AttendanceRecord> attendanceRecords = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAttendanceRecords();
  }

  Future<void> _fetchAttendanceRecords() async {
    // TODO: Replace with actual API call
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    
    // Sample data - replace with actual data from your backend
    setState(() {
      attendanceRecords = [
        AttendanceRecord(
          date: DateTime.now().subtract(Duration(days: 1)),
          status: 'Present',
          clockIn: TimeOfDay(hour: 9, minute: 0),
          clockOut: TimeOfDay(hour: 17, minute: 30),
          hoursWorked: 8.5,
        ),
        AttendanceRecord(
          date: DateTime.now().subtract(Duration(days: 2)),
          status: 'Late',
          clockIn: TimeOfDay(hour: 9, minute: 45),
          clockOut: TimeOfDay(hour: 18, minute: 0),
          hoursWorked: 8.25,
        ),
        // Add more sample records as needed
      ];
      isLoading = false;
    });
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'late':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '-';
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance History'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Wide screen layout
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _buildAttendanceTable(),
                    ),
                  );
                } else {
                  // Narrow screen layout
                  return ListView.builder(
                    itemCount: attendanceRecords.length,
                    itemBuilder: (context, index) {
                      final record = attendanceRecords[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('MMM dd, yyyy').format(record.date),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(record.status)
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      record.status,
                                      style: TextStyle(
                                        color: _getStatusColor(record.status),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Clock In'),
                                      Text(
                                        _formatTimeOfDay(record.clockIn),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Clock Out'),
                                      Text(
                                        _formatTimeOfDay(record.clockOut),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Hours'),
                                      Text(
                                        '${record.hoursWorked.toStringAsFixed(1)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }

  Widget _buildAttendanceTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Clock In')),
        DataColumn(label: Text('Clock Out')),
        DataColumn(label: Text('Hours Worked')),
      ],
      rows: attendanceRecords.map((record) {
        return DataRow(
          cells: [
            DataCell(Text(DateFormat('MMM dd, yyyy').format(record.date))),
            DataCell(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(record.status).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  record.status,
                  style: TextStyle(
                    color: _getStatusColor(record.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DataCell(Text(_formatTimeOfDay(record.clockIn))),
            DataCell(Text(_formatTimeOfDay(record.clockOut))),
            DataCell(Text('${record.hoursWorked.toStringAsFixed(1)}')),
          ],
        );
      }).toList(),
    );
  }
}