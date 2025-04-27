import 'package:flutter/material.dart';
import 'package:tamim/screens/available_schedule_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';

class ScheduleManagementScreen extends StatefulWidget {
  const ScheduleManagementScreen({super.key});

  @override
  State<ScheduleManagementScreen> createState() =>
      _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('봉사 일정 관리'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '봉사 가능일 관리'),
            Tab(text: '봉사 일정 생성'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AvailableScheduleScreen(),
          VolunteerConfirmationScreen(),
        ],
      ),
    );
  }
}
