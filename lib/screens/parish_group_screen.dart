import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/volunteer_event.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/screens/group_my_page_screen.dart';
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
    volunteers?.sort((a, b) =>
        a.position.id.compareTo(b.position.id)); // TODO: sort by sortNo
    final liturgicalEvents =
        context.watch<CalendarProvider>().liturgicalEvents[_selectedDay];

    Widget currentScreen = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
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
          const SizedBox(height: 16),
          if (liturgicalEvents != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이 날의 전례',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: liturgicalEvents.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                          title: Text(
                            liturgicalEvents[index].summary,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            liturgicalEvents[index]
                                    .description
                                    ?.replaceAll('\\n', '\n') ??
                                '',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          if (volunteers != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이 날 봉사자',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: volunteers.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                            backgroundColor: AppTheme.primaryColor.withAlpha(
                              26,
                            ),
                            backgroundImage: const AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                          title: Text(
                            volunteers[index].user != null
                                ? volunteers[index].user!.name
                                : volunteers[index].anon!.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            volunteers[index].position.positionName,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
    if (_selectedIndex == 1) {
      currentScreen = const GroupMypageScreen();
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
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
