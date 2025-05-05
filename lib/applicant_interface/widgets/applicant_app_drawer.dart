import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route.dart';

class ApplicantAppDrawer extends StatelessWidget {
  const ApplicantAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Drawer(
      backgroundColor: theme.colorScheme.background,
      elevation: 10,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome!',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildAnimatedListTile(
            icon: Icons.home,
            title: 'Home',
            onTap: () => Get.offAllNamed(RouteClass.applicantHome),
          ),
          _buildAnimatedListTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () => Get.toNamed(RouteClass.applicantProfile),
          ),
          _buildAnimatedListTile(
            icon: Icons.work,
            title: 'My Applications',
            onTap: () => Get.toNamed(RouteClass.applicantApplications),
          ),
          _buildAnimatedListTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () => Get.toNamed(RouteClass.applicantNotifications),
          ),
          _buildAnimatedListTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () => Get.toNamed(RouteClass.applicantSettings),
          ),
          const Spacer(),
          _buildAnimatedListTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => Get.offAllNamed(RouteClass.splash),
            isDestructive: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnimatedListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return MouseRegion(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: ListTile(
              leading: Icon(
                icon,
                color: isDestructive ? Colors.red : Colors.white,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.red : Colors.white,
                ),
              ),
              onTap: onTap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
