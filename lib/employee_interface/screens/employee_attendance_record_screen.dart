import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/employee_custom_app_bar.dart';
import '../widgets/employee_app_drawer.dart';

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
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late Map<DateTime, AttendanceRecord> _attendanceMap;

  @override
  void initState() {
    super.initState();
    _fetchAttendanceRecords();
  }

  Future<void> _fetchAttendanceRecords() async {
    // TODO: Replace with actual API call
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    
    final records = [
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
      AttendanceRecord(
        date: DateTime.now().subtract(Duration(days: 3)),
        status: 'Absent',
        hoursWorked: 0,
      ),
    ];

    setState(() {
      attendanceRecords = records;
      _attendanceMap = {
        for (var record in records)
          DateTime(
            record.date.year,
            record.date.month,
            record.date.day,
          ): record
      };
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

  Widget _buildCalendar() {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TableCalendar(
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.now(),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            defaultTextStyle: TextStyle(color: Colors.white),
            weekendTextStyle: TextStyle(color: Colors.white70),
            selectedTextStyle: TextStyle(color: Colors.black),
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(color: Colors.black),
            todayDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            markerDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 17),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.grey[400]),
            weekendStyle: TextStyle(color: Colors.grey[400]),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              final record = _attendanceMap[DateTime(date.year, date.month, date.day)];
              if (record != null) {
                return Positioned(
                  bottom: 1,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getStatusColor(record.status),
                    ),
                  ),
                );
              }
              return null;
            },
          ),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSelectedDayDetails() {
    final selectedRecord = _attendanceMap[DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    )];

    if (selectedRecord == null) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'No attendance record for this date',
          style: TextStyle(color: Colors.grey[400]),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEEE, MMMM d, y').format(selectedRecord.date),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(selectedRecord.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                selectedRecord.status,
                style: TextStyle(
                  color: _getStatusColor(selectedRecord.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTimeColumn('Clock In', selectedRecord.clockIn),
                _buildTimeColumn('Clock Out', selectedRecord.clockOut),
                _buildTimeColumn('Hours', selectedRecord.hoursWorked.toStringAsFixed(1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeColumn(String label, dynamic value) {
    String displayValue = value is TimeOfDay ? _formatTimeOfDay(value) : value.toString();
    
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey[400]),
        ),
        SizedBox(height: 4),
        Text(
          displayValue,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const EmployeeCustomAppBar(
        title: 'Attendance Records',
        canPop: true,
      ),
      drawer: const EmployeeAppDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildCalendar(),
                  _buildSelectedDayDetails(),
                ],
              ),
            ),
    );
  }
}