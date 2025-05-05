import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/applicant_custom_app_bar.dart';

class JobAvailableScreen extends StatelessWidget {
  const JobAvailableScreen({super.key});

  Map<String, List<Map<String, String>>> get departmentJobs => {
        'Information Technology': [
          {
            'title': 'Senior Software Engineer',
            'description': 'Expert in Flutter/Dart with 5+ years experience. Strong knowledge of state management and REST APIs.',
            'salary': '\$80,000 - \$120,000',
            'type': 'Full-time',
          },
          {
            'title': 'DevOps Engineer',
            'description': 'Experience with CI/CD, Docker, Kubernetes, and cloud platforms.',
            'salary': '\$90,000 - \$130,000',
            'type': 'Full-time',
          },
        ],
        'Marketing': [
          {
            'title': 'Digital Marketing Manager',
            'description': 'Lead digital marketing campaigns and social media strategies.',
            'salary': '\$65,000 - \$85,000',
            'type': 'Full-time',
          },
          {
            'title': 'Content Strategist',
            'description': 'Create and manage content across all marketing channels.',
            'salary': '\$55,000 - \$75,000',
            'type': 'Full-time',
          },
        ],
        'Finance': [
          {
            'title': 'Financial Analyst',
            'description': 'Analyze financial data and prepare reports for decision making.',
            'salary': '\$70,000 - \$90,000',
            'type': 'Full-time',
          },
          {
            'title': 'Account Manager',
            'description': 'Handle key client accounts and financial relationships.',
            'salary': '\$60,000 - \$80,000',
            'type': 'Full-time',
          },
        ],
        'Data Science': [
          {
            'title': 'Data Scientist',
            'description': 'Apply ML/AI techniques to solve complex business problems.',
            'salary': '\$90,000 - \$130,000',
            'type': 'Full-time',
          },
          {
            'title': 'Data Analyst',
            'description': 'Analyze data patterns and create visualization reports.',
            'salary': '\$65,000 - \$85,000',
            'type': 'Full-time',
          },
        ],
        'Others': [
          {
            'title': 'HR Manager',
            'description': 'Oversee HR operations and employee relations.',
            'salary': '\$70,000 - \$90,000',
            'type': 'Full-time',
          },
          {
            'title': 'Office Administrator',
            'description': 'Manage office operations and administrative tasks.',
            'salary': '\$45,000 - \$60,000',
            'type': 'Full-time',
          },
        ],
      };

  @override
  Widget build(BuildContext context) {
    final department = Get.arguments as String;
    final theme = Theme.of(context);
    final jobs = departmentJobs[department] ?? [];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          '$department Jobs',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onBackground),
          onPressed: () => Get.back(),
        ),
      ),
      body: jobs.isEmpty
          ? Center(
              child: Text(
                'No jobs available',
                style: theme.textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: theme.colorScheme.primary,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobs[index]['title']!,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              jobs[index]['description']!,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 165, 164, 164),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    jobs[index]['salary']!,
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 138, 138, 138),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    jobs[index]['type']!,
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                      '/applicant-apply-job',
                                      arguments: jobs[index],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: theme.colorScheme.primary,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                          color: theme.colorScheme.primary,
                                          width: 1,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 0,
                                      ),
                                    ),
                                    child: Text(
                                      'Apply Now',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
