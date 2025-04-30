import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/user_info.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/member_positions.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';
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

  // 멤버별 봉사 횟수 추적
  final Map<String, int> _memberServiceCount = {};

  @override
  void initState() {
    super.initState();
    _initializeMemberServiceCount();
  }

  void _initializeMemberServiceCount() {
    final availableMemberIds = context
        .read<VolunteerScheduleProvider>()
        .availableDateByMember
        .map((e) => e.id)
        .toList();
    for (final memberId in availableMemberIds) {
      _memberServiceCount[memberId] = 0;
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

  bool _isMemberAvailableForDate(String memberId, DateTime date) {
    final availableDates = context
        .read<VolunteerScheduleProvider>()
        .availableDateByMember
        .firstWhere((e) => e.id == memberId)
        .memberDates
        .toList();
    return availableDates.indexWhere((e) => isSameDay(e, date)) != -1;
  }

  bool _isMemberAvailableForPosition(String memberId, int positionId) {
    final availablePositions = context
        .read<VolunteerScheduleProvider>()
        .memberPositions
        .firstWhere((e) => e.id == memberId)
        .positions
        .map((e) => e.id)
        .toList();
    return availablePositions.contains(positionId);
  }

  UserInfo? _findBestMemberForPosition(
      DateTime date, int positionId, List<UserInfo> availableMembers) {
    logger.d('availableMembers: $availableMembers');
    final sortedMembers = availableMembers
        .where((member) =>
            _isMemberAvailableForDate(member.id ?? '', date) &&
            _isMemberAvailableForPosition(member.id ?? '', positionId))
        .toList()
      ..sort((a, b) => (_memberServiceCount[a.id] ?? 0)
          .compareTo(_memberServiceCount[b.id] ?? 0));

    return sortedMembers.isNotEmpty ? sortedMembers.first : null;
  }

  void _onCreateSchedule() async {
    if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('하나 이상의 날짜를 선택해주세요')),
      );
      return;
    }

    // 멤버별 봉사 횟수 초기화
    _initializeMemberServiceCount();

    // 각 날짜별로 봉사자 배정
    for (final date in _selectedDays) {
      final assignments = <int, UserInfo>{};
      final availableMembers = List<UserInfo>.from(context
          .read<ParishGroupProvider>()
          .parishGroupMemberInfos
          .map((member) => member.user));

      // 각 포지션별로 봉사자 배정
      final positions = context.read<ParishGroupProvider>().positions;
      for (final position in positions) {
        final selectedMember =
            _findBestMemberForPosition(date, position.id, availableMembers);

        if (selectedMember != null) {
          assignments[position.id] = selectedMember;
          _memberServiceCount[selectedMember.id ?? ''] =
              (_memberServiceCount[selectedMember.id ?? ''] ?? 0) + 1;
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

  void _showEditBottomSheet(DateTime date, Map<int, UserInfo?> assignments) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Consumer<ParishGroupProvider>(
          builder: (context, parishGroupProvider, child) {
            return EditVolunteerSheet(
              date: date,
              positions: parishGroupProvider.positions,
              assignments: assignments,
              memberAvailablePositions:
                  context.read<VolunteerScheduleProvider>().memberPositions,
              onSave: (updatedAssignments) {
                setState(() {
                  _assignments[date] = updatedAssignments;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildScheduleList() {
    if (!_isScheduleCreated) return const SizedBox.shrink();

    // 날짜순으로 정렬
    final sortedDays = List<DateTime>.from(_selectedDays)..sort();

    return Consumer<ParishGroupProvider>(
      builder: (context, parishGroupProvider, child) {
        final positions = parishGroupProvider.positions;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          padding: const EdgeInsets.all(16),
          itemCount: sortedDays.length,
          itemBuilder: (context, index) {
            final date = sortedDays[index];
            final assignments = _assignments[date] ?? {};

            return GestureDetector(
              onTap: () => _showEditBottomSheet(date, assignments),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${date.year}년 ${date.month}월 ${date.day}일',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...positions.map((position) {
                        final assignedMember = assignments[position.id];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                child: Text(
                                  position.positionName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Text(': '),
                              Expanded(
                                child: Text(
                                  assignedMember?.name ?? '미정',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
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
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                            children: () {
                              final sortedDays =
                                  List<DateTime>.from(_selectedDays)..sort();
                              return sortedDays
                                  .map((day) => Chip(
                                        label: Text(
                                          '${day.year}년 ${day.month}월 ${day.day}일',
                                        ),
                                        onDeleted: () {
                                          setState(() {
                                            _selectedDays.remove(day);
                                          });
                                        },
                                      ))
                                  .toList();
                            }(),
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

class EditVolunteerSheet extends StatefulWidget {
  final DateTime date;
  final List<Position> positions;
  final Map<int, UserInfo?> assignments;
  final List<MemberPositions> memberAvailablePositions;
  final Function(Map<int, UserInfo?>) onSave;

  const EditVolunteerSheet({
    super.key,
    required this.date,
    required this.positions,
    required this.assignments,
    required this.memberAvailablePositions,
    required this.onSave,
  });

  @override
  State<EditVolunteerSheet> createState() => _EditVolunteerSheetState();
}

class _EditVolunteerSheetState extends State<EditVolunteerSheet> {
  late Map<int, UserInfo?> _currentAssignments;
  final Map<int, TextEditingController> _manualInputControllers = {};

  @override
  void initState() {
    super.initState();
    _currentAssignments = Map.from(widget.assignments);
    for (final position in widget.positions) {
      _manualInputControllers[position.id] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final controller in _manualInputControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  List<UserInfo> _getAvailableMembersForPosition(Position position) {
    return context
        .read<ParishGroupProvider>()
        .parishGroupMemberInfos
        .map((member) => member.user)
        .where((member) {
      final availablePositions = widget.memberAvailablePositions
          .firstWhere((e) => e.id == member.id)
          .positions
          .map((e) => e.id)
          .toList();
      return availablePositions.contains(position.id);
    }).toList();
  }

  void _handleManualInput(int positionId, String name) {
    setState(() {
      if (name.isEmpty) {
        _currentAssignments[positionId] = null;
      } else {
        _currentAssignments[positionId] = UserInfo(
          id: 'manual_${DateTime.now().millisecondsSinceEpoch}',
          name: name,
          baptismalName: '',
          nickName: '',
          status: 'manual',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          agreePushAt: DateTime.now(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.date.year}년 ${widget.date.month}월 ${widget.date.day}일',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.positions.length,
            itemBuilder: (context, index) {
              final position = widget.positions[index];
              final assignedMember = _currentAssignments[position.id];
              final availableMembers =
                  _getAvailableMembersForPosition(position);
              final isManualInput = assignedMember?.status == 'manual';

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      position.positionName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<UserInfo>(
                            value: isManualInput ? null : assignedMember,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            items: [
                              const DropdownMenuItem<UserInfo>(
                                value: null,
                                child: Text('선택하세요'),
                              ),
                              ...availableMembers.map((member) {
                                return DropdownMenuItem<UserInfo>(
                                  value: member,
                                  child: Text(member.name ?? ''),
                                );
                              }),
                            ],
                            onChanged: (UserInfo? value) {
                              setState(() {
                                _currentAssignments[position.id] = value;
                                _manualInputControllers[position.id]?.clear();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('또는'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _manualInputControllers[position.id],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '직접 입력',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _handleManualInput(position.id, value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isManualInput)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '수동 입력: ${assignedMember?.name}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onSave(_currentAssignments);
                Navigator.pop(context);
              },
              child: const Text('저장'),
            ),
          ),
        ],
      ),
    );
  }
}
