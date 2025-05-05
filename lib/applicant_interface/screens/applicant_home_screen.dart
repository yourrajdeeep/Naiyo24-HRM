import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/ads_carousels.dart';
import '../widgets/applicant_custom_app_bar.dart';
import '../widgets/applicant_app_drawer.dart';
import '../../routes/route.dart';

class ApplicantHomeScreen extends StatelessWidget {
  const ApplicantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final departments = [
      {
        'name': 'Information Technology',
        'image': 'assets/icons/it.png'
      },
      {
        'name': 'Marketing',
        'image': 'assets/icons/marketing.png'
      },
      {
        'name': 'Finance',
        'image': 'assets/icons/finance.png'
      },
      {
        'name': 'Data Science',
        'image': 'assets/icons/datascience.png'
      },
      {
        'name': 'Others',
        'image': 'assets/icons/others.png'
      },
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const ApplicantCustomAppBar(title: 'Hello Applicant',),
      drawer: const ApplicantAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AdsCarousels(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore Departments',
                style: theme.textTheme.displayMedium,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: departments.length,
              itemBuilder: (context, index) {
                return _buildAnimatedDepartmentCard(
                  context,
                  departments[index],
                  theme,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedDepartmentCard(
    BuildContext context,
    Map<String, dynamic> department,
    ThemeData theme,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (0.1 * value),
          child: Card(
            elevation: 8 * value,
            color: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  RouteClass.applicantDepartmentJobs,
                  arguments: department['name'],
                  preventDuplicates: true,
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(department['image'] as String),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.surface.withOpacity(0.8),
                      BlendMode.overlay,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.colorScheme.surface.withOpacity(0.9),
                        theme.colorScheme.surface.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        department['name'] as String,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
