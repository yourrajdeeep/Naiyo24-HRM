import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Welcome to\nNaiyo24',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Please select your role to continue',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[400],
                ),
              ),
              const Spacer(),
              _RoleButton(
                icon: Icons.work,
                title: 'Employee',
                onTap: () => Get.toNamed('/employee-signin'),
              ),
              const SizedBox(height: 16),
              _RoleButton(
                icon: Icons.person_search,
                title: 'Job Applicant',
                onTap: () => Get.toNamed('/applicant-signin'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _RoleButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_RoleButton> createState() => _RoleButtonState();
}

class _RoleButtonState extends State<_RoleButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey[800] : Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isPressed ? Colors.white : Colors.grey[800]!,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(widget.icon, size: 30),
            const SizedBox(width: 16),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
}
