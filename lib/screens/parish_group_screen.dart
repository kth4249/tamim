import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/volunteer_event.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/screens/group_management_screen.dart';
import 'package:tamim/widgets/common_calendar.dart';
import '../theme/app_theme.dart';

class ParishGroupScreen extends StatefulWidget {
  const ParishGroupScreen({super.key, required this.id});

  final String id;

  @override
  State<ParishGroupScreen> createState() => _ParishGroupScreenState();
}

class _ParishGroupScreenState extends State<ParishGroupScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  int _selectedIndex = 0;

  @override
  void initState() {
    context.read<ParishGroupProvider>().fetchData(widget.id);
    super.initState();
  }

  List<VolunteerEvent> _getEventsForDay(DateTime day) {
    return context.read<ParishGroupProvider>().groupByVolunteerEvents[day] ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    final volunteers = context
        .read<ParishGroupProvider>()
        .groupByVolunteerEvents[_selectedDay];
    volunteers?.sort((a, b) => a.position.order.compareTo(b.position.order));
    final liturgicalEvents =
        context.watch<CalendarProvider>().liturgicalEvents[_selectedDay];

    List<Widget> slivers = [
      SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          child: CommonCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            selectedDay: _selectedDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
    ];

    if (liturgicalEvents != null) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('이 날의 전례',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final event = liturgicalEvents[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.church_outlined,
                        color: AppTheme.primaryColor),
                    title: Text(event.summary,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle:
                        Text(event.description?.replaceAll('\\n', '\n') ?? ''),
                  ),
                ),
              );
            },
            childCount: liturgicalEvents.length,
          ),
        ),
      );
    }

    if (volunteers != null) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('이 날 봉사자',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final volunteer = volunteers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.primaryColor.withAlpha(26),
                      backgroundImage:
                          const AssetImage('assets/images/profile.png'),
                    ),
                    title: Text(
                      volunteer.user != null
                          ? volunteer.user!.name
                          : volunteer.anon!.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(volunteer.position.positionName),
                  ),
                ),
              );
            },
            childCount: volunteers.length,
          ),
        ),
      );
    }

    slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 24)));

    Widget currentScreen = CustomScrollView(
      slivers: slivers,
    );

    if (_selectedIndex == 1) {
      currentScreen = const GroupManagementScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.watch<ParishGroupProvider>().parishGroup?.groupName ?? '',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '모임 설정',
          ),
        ],
      ),
    );
  }
}
