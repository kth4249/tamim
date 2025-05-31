import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/screens/main/home_screen.dart';
import 'package:tamim/screens/main/my_page_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int selected = 0;
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    context
        .read<MainProvider>()
        .fetchMyGroups(context.read<AuthProvider>().user!.id);
    context.read<CalendarProvider>().fetchIcsEvents();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = SafeArea(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeScreen(),
          MyPageScreen(),
        ],
      ),
    );

    return Scaffold(
      body: body,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(iconStyle: IconStyle.Default),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.house_outlined),
            selectedIcon: const Icon(Icons.house_rounded),
            title: const Text('홈'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.person_outline,
            ),
            selectedIcon: const Icon(
              Icons.person,
            ),
            title: const Text('프로필'),
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.square,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push('/create-group');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
