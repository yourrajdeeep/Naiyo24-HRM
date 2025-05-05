import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route.dart';
import '../screens/employee_settings_screen.dart';

class EmployeeAppDrawer extends StatelessWidget {
  const EmployeeAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildMenuItem(
            icon: Icons.home_outlined,
            title: 'Home',
            onTap: () => Get.offNamed(RouteClass.employeeHome),
          ),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Notices',
            onTap: () => Get.toNamed(RouteClass.employeeNotice),
          ),
          _buildMenuItem(
            icon: Icons.calendar_today_outlined,
            title: 'Attendance',
            onTap: () => Get.toNamed(RouteClass.employeeAttendanceRecord),
          ),
          _buildMenuItem(
            icon: Icons.people_outline,
            title: 'Meetings',
            onTap: () => Get.toNamed(RouteClass.employeeMeetings),
          ),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () => Get.toNamed(RouteClass.employeeSettings),
          ),
          const Spacer(),
          _buildMenuItem(
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () => Get.offAllNamed(RouteClass.roleSelection),
            isDestructive: true,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return InkWell(
      onTap: () => Get.toNamed(RouteClass.employeeAccount),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey[800]!, Colors.grey[900]!],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                  image: AssetImage('assets/images/default_avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'IT Department',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red[300] : Colors.grey[400],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red[300] : Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
    );
  }
}
