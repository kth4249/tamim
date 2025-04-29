import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/models/user_info.dart';
import 'package:tamim/models/member_dates.dart';
import 'package:tamim/models/member_positions.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import '../widgets/common_calendar.dart';

class CreateVolunteerScheduleScreen extends StatefulWidget {
  const CreateVolunteerScheduleScreen({super.key});

  @override
  State<CreateVolunteerScheduleScreen> createState() =>
      _CreateVolunteerScheduleScreenState();
}

class _CreateVolunteerScheduleScreenState
    extends State<CreateVolunteerScheduleScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  final List<DateTime> _selectedDays = [];
  final Map<DateTime, Map<int, UserInfo?>> _assignments = {};
  bool _isScheduleCreated = false;

  // 가데이터: 멤버별 봉사 가능 날짜
  // to DateTime
  final Map<String, List<DateTime>> _memberAvailableDates = {
    '이서영': [
      DateTime(2025, 5, 11),
      DateTime(2025, 5, 18),
      DateTime(2025, 5, 25)
    ],
    '신윤희': [DateTime(2025, 5, 25)],
    '이찬솔': [DateTime(2025, 5, 4), DateTime(2025, 5, 11), DateTime(2025, 5, 18)],
    '이세리': [DateTime(2025, 5, 11), DateTime(2025, 5, 25)],
    '황경섭': [DateTime(2025, 5, 11), DateTime(2025, 5, 25)],
    '박정은': [DateTime(2025, 5, 11), DateTime(2025, 5, 18)],
    '김서영': [DateTime(2025, 5, 4), DateTime(2025, 5, 18)],
    '박현우': [
      DateTime(2025, 5, 4),
      DateTime(2025, 5, 11),
      DateTime(2025, 5, 18),
      DateTime(2025, 5, 25)
    ],
    '심홍보': [
      DateTime(2025, 5, 4),
      DateTime(2025, 5, 11),
      DateTime(2025, 5, 18),
      DateTime(2025, 5, 25)
    ],
    '김태훈': [
      DateTime(2025, 5, 11),
      DateTime(2025, 5, 18),
      DateTime(2025, 5, 25)
    ],
  };

  // 가데이터: 멤버별 봉사 가능 포지션
  final Map<String, List<String>> _memberAvailablePositions = {
    '이서영': ['해설', '독서1', '독서2'],
    '신윤희': ['해설', '독서2'],
    '이찬솔': ['독서1', '독서2'],
    '이세리': ['해설', '독서1', '독서2'],
    '황경섭': ['해설', '독서1', '독서2'],
    '박정은': ['해설', '독서1', '독서2'],
    '김서영': ['독서1', '독서2'],
    '박현우': ['해설', '독서1', '독서2'],
    '심홍보': ['해설', '독서1', '독서2'],
    '김태훈': ['해설', '독서1', '독서2'],
  };

  // 멤버별 봉사 횟수 추적
  final Map<String, int> _memberServiceCount = {};

  @override
  void initState() {
    super.initState();
    _loadPositions();
    _initializeMemberServiceCount();
  }

  void _initializeMemberServiceCount() {
    for (final member in _memberAvailableDates.keys) {
      _memberServiceCount[member] = 0;
    }
  }

  void _loadPositions() {
    final provider = context.read<ParishGroupProvider>();
    if (provider.positions.isEmpty) {
      provider.loadPositions();
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (_isScheduleCreated) return;

    setState(() {
      _focusedDay = focusedDay;
      if (_selectedDays.any((day) => isSameDay(day, selectedDay))) {
        _selectedDays.removeWhere((day) => isSameDay(day, selectedDay));
      } else {
        _selectedDays.add(selectedDay);
      }
    });
  }

  bool _isMemberAvailableForDate(String memberName, DateTime date) {
    final availableDates = _memberAvailableDates[memberName] ?? [];
    return availableDates.indexWhere((e) => isSameDay(e, date)) != -1;
  }

  bool _isMemberAvailableForPosition(String memberName, String positionName) {
    final availablePositions = _memberAvailablePositions[memberName] ?? [];
    return availablePositions.contains(positionName);
  }

  UserInfo? _findBestMemberForPosition(
      DateTime date, String positionName, List<UserInfo> availableMembers) {
    // 봉사 횟수가 가장 적은 멤버들 중에서 선택
    final sortedMembers = availableMembers
        .where((member) =>
            _isMemberAvailableForDate(member.name ?? '', date) &&
            _isMemberAvailableForPosition(member.name ?? '', positionName))
        .toList()
      ..sort((a, b) => (_memberServiceCount[a.name ?? ''] ?? 0)
          .compareTo(_memberServiceCount[b.name ?? ''] ?? 0));

    return sortedMembers.isNotEmpty ? sortedMembers.first : null;
  }

  void _onCreateSchedule() async {
    if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('하나 이상의 날짜를 선택해주세요')),
      );
      return;
    }

    final members = context.read<ParishGroupProvider>().parishGroupMemberInfos;
    final positions = context.read<ParishGroupProvider>().positions;

    if (members.isEmpty || positions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('봉사자나 포지션이 없습니다')),
      );
      return;
    }

    // 멤버별 봉사 횟수 초기화
    _initializeMemberServiceCount();

    // 각 날짜별로 봉사자 배정
    for (final date in _selectedDays) {
      final assignments = <int, UserInfo>{};
      final availableMembers = members.map((m) => m.user).toList();

      // 각 포지션별로 봉사자 배정
      for (final position in positions) {
        final selectedMember = _findBestMemberForPosition(
            date, position.positionName, availableMembers);

        if (selectedMember != null) {
          assignments[position.id] = selectedMember;
          _memberServiceCount[selectedMember.name ?? ''] =
              (_memberServiceCount[selectedMember.name ?? ''] ?? 0) + 1;
          availableMembers.remove(selectedMember);
        }
      }

      _assignments[date] = assignments;
    }

    setState(() {
      _isScheduleCreated = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('봉사 일정이 생성되었습니다')),
    );
  }

  Widget _buildScheduleList() {
    if (!_isScheduleCreated) return const SizedBox.shrink();

    final positions = context.watch<ParishGroupProvider>().positions;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _selectedDays.length,
      itemBuilder: (context, index) {
        final date = _selectedDays[index];
        final assignments = _assignments[date] ?? {};

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${date.year}년 ${date.month}월 ${date.day}일',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...positions.map((position) {
                  final assignedMember = assignments[position.id];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            position.positionName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Text(': '),
                        Expanded(
                          child: Text(
                            assignedMember?.name ?? '미정',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('봉사표 생성'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CommonCalendar(
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    focusedDay: _focusedDay,
                    selectedDays: _selectedDays,
                    onDaySelected: _onDaySelected,
                    isMultiSelect: true,
                  ),
                  const SizedBox(height: 16),
                  if (_selectedDays.isNotEmpty && !_isScheduleCreated)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '선택된 날짜',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _selectedDays.map((day) {
                              return Chip(
                                label: Text(
                                  '${day.year}년 ${day.month}월 ${day.day}일',
                                ),
                                onDeleted: () {
                                  setState(() {
                                    _selectedDays.remove(day);
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                  _buildScheduleList(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _isScheduleCreated ? null : _onCreateSchedule,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                _isScheduleCreated ? '봉사표 생성됨' : '봉사표 생성',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
