import 'package:flutter/material.dart';
import '../widgets/applicant_custom_app_bar.dart';
import '../widgets/applicant_app_drawer.dart';

class ApplicantSettingsScreen extends StatelessWidget {
  const ApplicantSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicantCustomAppBar(title: 'Settings'),
      drawer: const ApplicantAppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildSettingsGroup(
                'Account',
                [
                  _buildSettingsTile(
                    icon: Icons.person,
                    title: 'Personal Information',
                    subtitle: 'Manage your personal details',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.lock,
                    title: 'Privacy & Security',
                    subtitle: 'Password, security settings',
                    onTap: () {},
                  ),
                ],
              ),
              _buildSettingsGroup(
                'Preferences',
                [
                  _buildSettingsTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Manage notification preferences',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'Change application language',
                    onTap: () {},
                  ),
                ],
              ),
              _buildSettingsGroup(
                'Support',
                [
                  _buildSettingsTile(
                    icon: Icons.help,
                    title: 'Help Center',
                    subtitle: 'Get help and support',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.info,
                    title: 'About',
                    subtitle: 'App information and legal',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(children: tiles),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.blue),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
