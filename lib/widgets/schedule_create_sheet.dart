import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/schedule.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/schedule_provider.dart';
import '../theme/app_theme.dart';

class ScheduleCreateSheet extends StatefulWidget {
  final int groupId;
  final DateTime selectedDate;

  const ScheduleCreateSheet({
    super.key,
    required this.groupId,
    required this.selectedDate,
  });

  @override
  State<ScheduleCreateSheet> createState() => _ScheduleCreateSheetState();
}

class _ScheduleCreateSheetState extends State<ScheduleCreateSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _openChatController = TextEditingController();
  final _recruitController = TextEditingController();
  DateTime? _selectedDateTime;
  String _shareScope = ScheduleShareScope.public.value;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.selectedDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _openChatController.dispose();
    _recruitController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // 실제 앱에서는 parishGroup, tamimUser 객체를 올바르게 넣어야 함
    final event = Schedule(
      id: 0, // 실제로는 Supabase에서 자동 생성
      scheduleDatetime: _selectedDateTime!,
      groupId: widget.groupId,
      userId: context.read<AuthProvider>().user?.id ?? '', // 실제 로그인 유저 정보로 대체
      scheduleName: _nameController.text,
      scheduleDesc: _descController.text,
      openChatUrl: _openChatController.text,
      recruiteCount: int.tryParse(_recruitController.text) ?? 0,
      shareScope: _shareScope,
    ).toJson();

    event.remove('id');

    await context.read<ScheduleProvider>().createSchedule(event);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('일정 생성',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '일정명',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? '일정명을 입력하세요' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: '설명',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _openChatController,
                  decoration: const InputDecoration(
                    labelText: '오픈채팅 URL',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _recruitController,
                  decoration: const InputDecoration(
                    labelText: '모집 인원',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('공개 범위:'),
                    const SizedBox(width: 16),
                    DropdownButton<String>(
                      value: _shareScope,
                      items: [
                        DropdownMenuItem(
                            value: ScheduleShareScope.public.value,
                            child: Text(ScheduleShareScope.public.name)),
                        DropdownMenuItem(
                            value: ScheduleShareScope.group.value,
                            child: Text(ScheduleShareScope.group.name)),
                      ],
                      onChanged: (v) {
                        if (v != null) setState(() => _shareScope = v);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('일정 날짜:'),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDateTime!,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() => _selectedDateTime = picked);
                        }
                      },
                      child: Text(
                          '${_selectedDateTime!.year}-${_selectedDateTime!.month}-${_selectedDateTime!.day}'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('저장',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 수정 폼: 생성 폼과 거의 동일, 다만 기존 값 세팅 및 updateSchedule 호출
class ScheduleEditSheet extends StatefulWidget {
  final Schedule schedule;

  const ScheduleEditSheet({super.key, required this.schedule});

  @override
  State<ScheduleEditSheet> createState() => _ScheduleEditSheetState();
}

class _ScheduleEditSheetState extends State<ScheduleEditSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _openChatController;
  late TextEditingController _recruitController;
  late DateTime _selectedDateTime;
  late String _shareScope;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.schedule.scheduleName);
    _descController = TextEditingController(text: widget.schedule.scheduleDesc);
    _openChatController =
        TextEditingController(text: widget.schedule.openChatUrl);
    _recruitController =
        TextEditingController(text: widget.schedule.recruiteCount.toString());
    _selectedDateTime = widget.schedule.scheduleDatetime;
    _shareScope = widget.schedule.shareScope;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _openChatController.dispose();
    _recruitController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final updated = widget.schedule.copyWith(
      scheduleDatetime: _selectedDateTime,
      scheduleName: _nameController.text,
      scheduleDesc: _descController.text,
      openChatUrl: _openChatController.text,
      recruiteCount: int.tryParse(_recruitController.text) ?? 0,
      shareScope: _shareScope,
    );

    await context.read<ScheduleProvider>().updateSchedule(updated);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('일정 수정',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '일정명',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? '일정명을 입력하세요' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: '설명',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _openChatController,
                  decoration: const InputDecoration(
                    labelText: '오픈채팅 URL',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _recruitController,
                  decoration: const InputDecoration(
                    labelText: '모집 인원',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('공개 범위:'),
                    const SizedBox(width: 16),
                    DropdownButton<String>(
                      value: _shareScope,
                      items: [
                        DropdownMenuItem(
                            value: ScheduleShareScope.public.value,
                            child: Text(ScheduleShareScope.public.name)),
                        DropdownMenuItem(
                            value: ScheduleShareScope.group.value,
                            child: Text(ScheduleShareScope.group.name)),
                      ],
                      onChanged: (v) {
                        if (v != null) setState(() => _shareScope = v);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('일정 날짜:'),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDateTime,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() => _selectedDateTime = picked);
                        }
                      },
                      child: Text(
                          '${_selectedDateTime.year}-${_selectedDateTime.month}-${_selectedDateTime.day}'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('저장',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
