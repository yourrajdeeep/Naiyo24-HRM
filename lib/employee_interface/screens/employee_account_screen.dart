import 'package:flutter/material.dart';
import '../widgets/employee_custom_app_bar.dart';
import '../widgets/employee_app_drawer.dart';

class EmployeeAccountScreen extends StatelessWidget {
  const EmployeeAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const EmployeeCustomAppBar(
        title: 'My Profile',
        canPop: true,
      ),
      drawer: const EmployeeAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInfoSection(
                    title: 'Personal Information',
                    items: [
                      _buildInfoItem(
                        icon: Icons.person_outline,
                        label: 'Full Name',
                        value: 'John Doe',
                      ),
                      _buildInfoItem(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: 'john.doe@company.com',
                      ),
                      _buildInfoItem(
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: '+1 234 567 8900',
                      ),
                      _buildInfoItem(
                        icon: Icons.cake_outlined,
                        label: 'Date of Birth',
                        value: 'January 15, 1990',
                      ),
                      _buildInfoItem(
                        icon: Icons.location_on_outlined,
                        label: 'Address',
                        value: '123 Business Street, Tech City, TC 12345',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildInfoSection(
                    title: 'Professional Information',
                    items: [
                      _buildInfoItem(
                        icon: Icons.badge_outlined,
                        label: 'Employee ID',
                        value: 'EMP001234',
                      ),
                      _buildInfoItem(
                        icon: Icons.work_outline,
                        label: 'Department',
                        value: 'IT Department',
                      ),
                      _buildInfoItem(
                        icon: Icons.person_pin_outlined,
                        label: 'Designation',
                        value: 'Senior Software Engineer',
                      ),
                      _buildInfoItem(
                        icon: Icons.calendar_today_outlined,
                        label: 'Join Date',
                        value: 'March 1, 2020',
                      ),
                      _buildInfoItem(
                        icon: Icons.supervised_user_circle_outlined,
                        label: 'Reporting To',
                        value: 'Jane Smith (Tech Lead)',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildInfoSection(
                    title: 'Skills & Expertise',
                    items: [
                      _buildSkillsGrid([
                        'Flutter',
                        'React',
                        'Node.js',
                        'Python',
                        'AWS',
                        'Docker',
                        'Git',
                        'Agile',
                      ]),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildInfoSection(
                    title: 'Documents',
                    items: [
                      _buildDocumentItem(
                        icon: Icons.badge_outlined,
                        title: 'ID Card',
                        subtitle: 'Company ID Card',
                        onTap: () {
                          // TODO: View ID Card
                        },
                      ),
                      _buildDocumentItem(
                        icon: Icons.description_outlined,
                        title: 'Resume',
                        subtitle: 'Updated resume',
                        onTap: () {
                          // TODO: View Resume
                        },
                      ),
                      _buildDocumentItem(
                        icon: Icons.verified_outlined,
                        title: 'Certificates',
                        subtitle: '5 Professional certifications',
                        onTap: () {
                          // TODO: View Certificates
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildActionButtons(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/default_avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Senior Software Engineer',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Active Employee',
              style: TextStyle(
                color: Colors.blue[300],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<Widget> items,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: Colors.blue[300],
                  size: 20,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          ...items,
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue[300], size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(List<String> skills) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: skills.map((skill) => _buildSkillChip(skill)).toList(),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blue.withOpacity(0.3),
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.blue[300],
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildDocumentItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.blue[300]),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey[600],
      ),
      onTap: onTap,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // TODO: Edit Profile
            },
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // TODO: Download Profile
            },
            child: const Text(
              'Download CV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}