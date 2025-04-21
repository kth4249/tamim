import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupManagementScreen extends StatelessWidget {
  const GroupManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMenuButton(
              context: context,
              label: '모임원 관리',
              icon: Icons.group,
              routeName: '/member-management',
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context: context,
              label: '봉사 포지션 관리',
              icon: Icons.work_outline,
              routeName: '/position-management',
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context: context,
              label: '차월 봉사 일정 생성',
              icon: Icons.calendar_month,
              routeName: '/schedule-creation',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String routeName,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onPressed: () {
          context.push(routeName);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}
