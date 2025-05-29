import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/theme/app_theme.dart';
import 'package:tamim/widgets/parish_groups/my_group_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final groupMainInfo = context.watch<MainProvider>().groupMainInfo;
    final todaysLiturgical =
        context.watch<CalendarProvider>().liturgicalEvents[DateTime.now()];

    List<Widget> slivers = [
      SliverPadding(
        padding: const EdgeInsets.only(left: 16, top: 24, right: 8, bottom: 8),
        sliver: SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/logo.png', width: screenWidth * 0.05),
              const SizedBox(width: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "Tamim",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '성당 커뮤니티',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.3,
              child: TabBar(
                controller: _tabController,
                labelColor: AppTheme.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppTheme.primaryColor,
                tabs: const [
                  Tab(text: '내 단체'),
                  // Tab(text: '전체 모임'),
                ],
              ),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyGroupList(),
                // GroupList(groups: groups),
              ],
            ),
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(height: 16),
      ),
    ];

    if (todaysLiturgical != null) {
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final event = todaysLiturgical[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
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
                  ),
                );
              },
              childCount: todaysLiturgical.length,
            ),
          ),
        ),
      );
    }

    if (groupMainInfo != null) {
      slivers.add(SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: Column(
            children: [
              InkWell(
                onTap: () => context.push('/parish-groups/${groupMainInfo.id}'),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.primaryColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.church, color: Colors.white, size: 40),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(groupMainInfo.category.categoryName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Text(groupMainInfo.parish.parishName,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: CustomScrollView(
        slivers: slivers,
      ),
    );
  }
}
