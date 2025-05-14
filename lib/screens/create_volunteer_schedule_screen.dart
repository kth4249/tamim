import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/volunteer_create.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';
import 'package:tamim/viewmodels/volunteer_schedule_viewmodel.dart';
import 'package:tamim/widgets/edit_volunteer_sheet.dart';
import '../widgets/common_calendar.dart';

class CreateVolunteerScheduleScreen extends StatefulWidget {
  const CreateVolunteerScheduleScreen({super.key});

  @override
  State<CreateVolunteerScheduleScreen> createState() =>
      _CreateVolunteerScheduleScreenState();
}

class _CreateVolunteerScheduleScreenState
    extends State<CreateVolunteerScheduleScreen> {
  late final VolunteerScheduleViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = VolunteerScheduleViewModel();
    _viewModel.initialize(context);
  }

  void _showEditBottomSheet(
      DateTime date, Map<int, VolunteerCreateVO?> assignments) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
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
                  _viewModel.updateAssignments(date, updatedAssignments);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleList() {
    if (!_viewModel.isScheduleCreated) return const SizedBox.shrink();

    final sortedDays = List<DateTime>.from(_viewModel.selectedDays)..sort();

    return Consumer<ParishGroupProvider>(
      builder: (context, parishGroupProvider, child) {
        final positions = parishGroupProvider.positions;
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          padding: const EdgeInsets.all(16),
          itemCount: sortedDays.length,
          itemBuilder: (context, index) {
            final date = sortedDays[index];
            final assignments = _viewModel.assignments[date] ?? {};

            return GestureDetector(
              onTap: () => _showEditBottomSheet(date, assignments),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${date.month}월 ${date.day}일',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              controller: ScrollController(),
                              child: Column(
                                children: positions.map((position) {
                                  final assignedMember =
                                      assignments[position.id];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            position.positionName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            assignedMember?.nickname ?? '미정',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: assignedMember?.nickname !=
                                                      null
                                                  ? colorScheme.onSurface
                                                  : colorScheme.error,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            if (positions.length > 4)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        colorScheme.surface.withOpacity(0),
                                        colorScheme.surface,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<VolunteerScheduleViewModel>(
        builder: (context, viewModel, child) {
          return Consumer<ParishGroupProvider>(
            builder: (context, parishGroupProvider, child) {
              if (parishGroupProvider.positions.isEmpty) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text(
                      '봉사표 생성',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.onSurface,
                  ),
                  body: Center(
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.work_outline,
                            size: 48,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '포지션이 없습니다',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '봉사일정을 생성하기 위해서는 먼저 포지션을 생성해야 합니다.\n봉사 관리 화면에서 포지션을 추가해주세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.onSurfaceVariant,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('봉사 관리로 이동'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    '봉사표 생성',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: colorScheme.surface,
                  foregroundColor: colorScheme.onSurface,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CommonCalendar(
                                firstDay: viewModel.firstDay,
                                lastDay: viewModel.lastDay,
                                focusedDay: viewModel.focusedDay,
                                selectedDays: viewModel.selectedDays,
                                onDaySelected: viewModel.onDaySelected,
                                isMultiSelect: true,
                                eventLoader: (day) =>
                                    viewModel.getEventsForDay(context, day),
                              ),
                            ),
                            if (viewModel.selectedDays.isNotEmpty &&
                                !viewModel.isScheduleCreated)
                              Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: colorScheme.surface,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 20,
                                          color: colorScheme.primary,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          '선택된 날짜',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: () {
                                        final sortedDays = List<DateTime>.from(
                                            viewModel.selectedDays)
                                          ..sort();
                                        return sortedDays
                                            .map((day) => Container(
                                                  decoration: BoxDecoration(
                                                    color: colorScheme
                                                        .primaryContainer,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          '${day.month}월 ${day.day}일',
                                                          style: TextStyle(
                                                            color: colorScheme
                                                                .onPrimaryContainer,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        GestureDetector(
                                                          onTap: () {
                                                            viewModel
                                                                .onDaySelected(
                                                                    day, day);
                                                          },
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 16,
                                                            color: colorScheme
                                                                .onPrimaryContainer,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                            .toList();
                                      }(),
                                    ),
                                  ],
                                ),
                              ),
                            _buildScheduleList(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          if (viewModel.isScheduleCreated)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final confirmed = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('봉사일정 확정'),
                                      content: const Text(
                                        '봉사일정을 확정하시겠습니까?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('취소'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text('확정'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirmed == true) {
                                    await viewModel
                                        .saveVolunteerSchedule(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  '봉사일정 확정',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ElevatedButton(
                            onPressed: viewModel.isScheduleCreated
                                ? null
                                : () => viewModel.onCreateSchedule(context),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: viewModel.isScheduleCreated
                                  ? colorScheme.surfaceContainerHighest
                                  : colorScheme.primary,
                              foregroundColor: viewModel.isScheduleCreated
                                  ? colorScheme.onSurfaceVariant
                                  : colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              viewModel.isScheduleCreated
                                  ? '봉사표 생성됨'
                                  : '봉사표 생성',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
