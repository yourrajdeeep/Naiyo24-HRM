import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route.dart';
import '../widgets/employee_custom_app_bar.dart';
import '../widgets/employee_app_drawer.dart';

class EmployeeSettingsScreen extends StatefulWidget {
  const EmployeeSettingsScreen({Key? key}) : super(key: key);

  @override
  _EmployeeSettingsScreenState createState() => _EmployeeSettingsScreenState();
}

class _EmployeeSettingsScreenState extends State<EmployeeSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _darkMode = true;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'Dark';

  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];
  final List<String> _themes = ['Dark', 'Light', 'System'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(RouteClass.employeeHome);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: const EmployeeCustomAppBar(
          title: 'Settings',
          canPop: true,
        ),
        drawer: const EmployeeAppDrawer(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSettingsGroup(
              'Account',
              [
                _buildNavigationTile(
                  icon: Icons.person_outline,
                  title: 'Profile Settings',
                  subtitle: 'Manage your personal information',
                  onTap: () => Get.toNamed(RouteClass.employeeAccount),
                ),
                _buildNavigationTile(
                  icon: Icons.lock_outline,
                  title: 'Security',
                  subtitle: 'Password, 2FA, and security settings',
                  onTap: () {
                    // TODO: Navigate to security settings
                  },
                ),
              ],
            ),
            _buildSettingsGroup(
              'Notifications',
              [
                _buildSwitchTile(
                  icon: Icons.notifications_outlined,
                  title: 'Enable Notifications',
                  subtitle: 'Turn on/off all notifications',
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                      if (!value) {
                        _emailNotifications = false;
                        _pushNotifications = false;
                      }
                    });
                  },
                ),
                if (_notificationsEnabled) ...[
                  _buildSwitchTile(
                    icon: Icons.email_outlined,
                    title: 'Email Notifications',
                    subtitle: 'Receive notifications via email',
                    value: _emailNotifications,
                    onChanged: (value) {
                      setState(() => _emailNotifications = value);
                    },
                  ),
                  _buildSwitchTile(
                    icon: Icons.mobile_friendly_outlined,
                    title: 'Push Notifications',
                    subtitle: 'Receive push notifications',
                    value: _pushNotifications,
                    onChanged: (value) {
                      setState(() => _pushNotifications = value);
                    },
                  ),
                ],
              ],
            ),
            _buildSettingsGroup(
              'Appearance',
              [
                _buildDropdownTile(
                  icon: Icons.palette_outlined,
                  title: 'Theme',
                  subtitle: 'Choose your preferred theme',
                  value: _selectedTheme,
                  items: _themes,
                  onChanged: (value) {
                    setState(() => _selectedTheme = value!);
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  subtitle: 'Toggle dark mode on/off',
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() => _darkMode = value);
                  },
                ),
              ],
            ),
            _buildSettingsGroup(
              'Preferences',
              [
                _buildDropdownTile(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  subtitle: 'Choose your preferred language',
                  value: _selectedLanguage,
                  items: _languages,
                  onChanged: (value) {
                    setState(() => _selectedLanguage = value!);
                  },
                ),
              ],
            ),
            _buildSettingsGroup(
              'Support',
              [
                _buildNavigationTile(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  subtitle: 'FAQs and support resources',
                  onTap: () {
                    // TODO: Navigate to help center
                  },
                ),
                _buildNavigationTile(
                  icon: Icons.bug_report_outlined,
                  title: 'Report an Issue',
                  subtitle: 'Report bugs or request features',
                  onTap: () {
                    // TODO: Navigate to issue reporting
                  },
                ),
              ],
            ),
            _buildSettingsGroup(
              'About',
              [
                _buildNavigationTile(
                  icon: Icons.info_outline,
                  title: 'About App',
                  subtitle: 'Version, licenses, and legal info',
                  onTap: () {
                    // TODO: Navigate to about page
                  },
                ),
                _buildNavigationTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy policy',
                  onTap: () {
                    // TODO: Navigate to privacy policy
                  },
                ),
              ],
            ),
          ],
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

  Widget _buildNavigationTile({
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
              Icon(
                Icons.chevron_right,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
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
          DropdownButton<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
            dropdownColor: Colors.grey[800],
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
            underline: Container(),
          ),
        ],
      ),
    );
  }
}