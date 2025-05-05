import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/employee_custom_app_bar.dart';
import '../widgets/employee_app_drawer.dart';

class Meeting {
  final String title;
  final DateTime date;
  final List<String> participants;
  final String agenda;

  Meeting({
    required this.title,
    required this.date,
    required this.participants,
    required this.agenda,
  });
}

class EmployeeMeetingsScreen extends StatefulWidget {
  const EmployeeMeetingsScreen({Key? key}) : super(key: key);

  @override
  _EmployeeMeetingsScreenState createState() => _EmployeeMeetingsScreenState();
}

class _EmployeeMeetingsScreenState extends State<EmployeeMeetingsScreen> {
  List<Meeting> meetings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMeetings();
  }

  Future<void> _fetchMeetings() async {
    // TODO: Replace with actual API call
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    setState(() {
      meetings = [
        Meeting(
          title: 'Weekly Team Sync',
          date: DateTime.now().add(const Duration(days: 1)),
          participants: ['John Doe', 'Jane Smith', 'Mike Johnson'],
          agenda: 'Project updates and sprint planning',
        ),
        Meeting(
          title: 'Product Review',
          date: DateTime.now().add(const Duration(days: 2)),
          participants: ['Alice Brown', 'Bob Wilson', 'John Doe'],
          agenda: 'Review Q2 product roadmap and features',
        ),
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const EmployeeCustomAppBar(
        title: 'Upcoming Meetings',
        canPop: true,
      ),
      drawer: const EmployeeAppDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : meetings.isEmpty
              ? Center(
                  child: Text(
                    'No upcoming meetings',
                    style: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: meetings.length,
                  itemBuilder: (context, index) {
                    final meeting = meetings[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      color: Colors.grey[900],
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meeting.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    size: 16, color: Colors.blue[300]),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat('EEEE, MMMM d, y')
                                      .format(meeting.date),
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(Icons.access_time,
                                    size: 16, color: Colors.blue[300]),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat('h:mm a').format(meeting.date),
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Participants:',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: meeting.participants
                                  .map((participant) => Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          participant,
                                          style: TextStyle(
                                            color: Colors.blue[300],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Agenda:',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              meeting.agenda,
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}