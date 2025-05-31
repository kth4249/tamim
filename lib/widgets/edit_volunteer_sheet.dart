import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/tamim_user.dart';
import 'package:tamim/models/member_positions.dart';
import 'package:tamim/models/volunteer_create.dart';
import 'package:tamim/providers/parish_group_provider.dart';

class EditVolunteerSheet extends StatefulWidget {
  final DateTime date;
  final List<Position> positions;
  final Map<int, VolunteerCreateVO?> assignments;
  final List<MemberPositions> memberAvailablePositions;
  final Function(Map<int, VolunteerCreateVO?>) onSave;

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
  late Map<int, VolunteerCreateVO?> _currentAssignments;
  final Map<int, TextEditingController> _manualInputControllers = {};
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _currentAssignments = Map.from(widget.assignments);
    for (final position in widget.positions) {
      String? text = _currentAssignments[position.id]?.userId == null
          ? _currentAssignments[position.id]?.nickname
          : null;
      _manualInputControllers[position.id] = TextEditingController(text: text);
    }
  }

  @override
  void dispose() {
    for (final controller in _manualInputControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  List<TamimUser> _getAvailableMembersForPosition(Position position) {
    return context
        .read<ParishGroupProvider>()
        .parishGroupMemberInfos
        .where((e) => e.status == 'active')
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
      _currentAssignments[positionId] = VolunteerCreateVO(
        id: _currentAssignments[positionId]?.id,
        userId: null,
        name: name,
        nickname: name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${widget.date.month}월 ${widget.date.day}일',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.positions.length,
                itemBuilder: (context, index) {
                  final position = widget.positions[index];
                  final assignedMember = _currentAssignments[position.id];
                  final availableMembers =
                      _getAvailableMembersForPosition(position);
                  final isManualInput =
                      assignedMember != null && assignedMember.userId == null;

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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: isManualInput
                                    ? null
                                    : assignedMember?.userId,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                items: [
                                  const DropdownMenuItem<String>(
                                    value: null,
                                    child: Text('선택하세요'),
                                  ),
                                  ...availableMembers.map((member) {
                                    return DropdownMenuItem<String>(
                                      value: member.id,
                                      child: Text(
                                        member.userInfo?.nickname ?? '',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }),
                                ],
                                onChanged: (String? value) {
                                  final current =
                                      _currentAssignments[position.id];
                                  setState(() {
                                    _currentAssignments[position.id] = value ==
                                            null
                                        ? VolunteerCreateVO(
                                            id: current?.id,
                                            userId: null,
                                            name: '',
                                            nickname: '',
                                          )
                                        : VolunteerCreateVO(
                                            id: current?.id,
                                            userId: value,
                                            name: availableMembers
                                                .firstWhere(
                                                    (e) => e.id == value)
                                                .name,
                                            nickname: availableMembers
                                                    .firstWhere(
                                                        (e) => e.id == value)
                                                    .userInfo
                                                    ?.nickname ??
                                                '',
                                          );
                                    _manualInputControllers[position.id]
                                        ?.clear();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('또는'),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _manualInputControllers[position.id],
                                validator: (value) {
                                  if (value != null && value.length >= 10) {
                                    return '10글자 미만이어야 합니다';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: '직접 입력(10글자 이내)',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                onChanged: (value) {
                                  _handleManualInput(position.id, value);
                                },
                              ),
                            ),
                          ],
                        ),
                        if (isManualInput)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '수동 입력: ${assignedMember.nickname}',
                              style: TextStyle(
                                color: colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.onSave(_currentAssignments);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '저장',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
