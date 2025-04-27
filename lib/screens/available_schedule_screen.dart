import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 포맷팅을 위해 추가
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';

class AvailableScheduleScreen extends StatefulWidget {
  const AvailableScheduleScreen({super.key});

  @override
  State<AvailableScheduleScreen> createState() =>
      _AvailableScheduleScreenState();
}

class _AvailableScheduleScreenState extends State<AvailableScheduleScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  // DateTime _focusedDay = DateTime(2024, 3, 1); // 현재 달력이 보여주는 월

  @override
  void initState() {
    super.initState();
    context.read<VolunteerScheduleProvider>().fetchAvailableDateByMember(
        context.read<ParishGroupProvider>().parishGroup!.id);
  }

  @override
  Widget build(BuildContext context) {
    final availableDateByMember =
        context.watch<VolunteerScheduleProvider>().availableDateByMember;
    final selectedMemberId =
        context.watch<VolunteerScheduleProvider>().selectedMemberId;
    final selectedDays =
        (availableDateByMember.isNotEmpty && selectedMemberId != null)
            ? availableDateByMember
                .firstWhere((element) => element.id == selectedMemberId)
                .memberDates
            : [];
    // 선택된 날짜 목록을 문자열로 변환 (예: "3월 5일, 13일, 20일")
    String selectedDaysText = selectedDays.isNotEmpty
        ? DateFormat('M월 d일', 'ko_KR').format(selectedDays.first) +
            selectedDays
                .skip(1)
                .map((day) => DateFormat('d일', 'ko_KR').format(day))
                .join(', ')
        : '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (var d in availableDateByMember)
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<VolunteerScheduleProvider>()
                          .selectMember(d.id);
                    },
                    child: Text(d.name),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCalendar(),
            const SizedBox(height: 24),
            const Text(
              '선택하신 날짜',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(selectedDaysText),
            const Spacer(), // 하단 버튼을 맨 아래로 밀기 위함
          ],
        ),
      ),
    );
  }

  // 달력 위젯 생성
  Widget _buildCalendar() {
    final availableDateByMember =
        context.watch<VolunteerScheduleProvider>().availableDateByMember;
    final selectedMemberId =
        context.watch<VolunteerScheduleProvider>().selectedMemberId;
    final selectedDays =
        (availableDateByMember.isNotEmpty && selectedMemberId != null)
            ? availableDateByMember
                .firstWhere((element) => element.id == selectedMemberId)
                .memberDates
            : [];
    return TableCalendar<DateTime>(
      locale: 'ko_KR',
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return selectedDays.where((e) => isSameDay(e, day)).isNotEmpty;
      },
      onDaySelected: (selectedDay, focusedDay) async {
        await context.read<VolunteerScheduleProvider>().changeDate(selectedDay);
      },
      onPageChanged: (focusedDay) {
        // 페이지(월) 변경 시 포커스 업데이트
        _focusedDay = focusedDay;
      },
      calendarBuilders: CalendarBuilders(
        // 주말 (토, 일) 스타일링
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday ||
              day.weekday == DateTime.saturday) {
            final text = DateFormat.E('ko_KR').format(day);
            return Center(
              child: Text(text, style: const TextStyle(color: Colors.red)),
            );
          }
          return null; // 기본 스타일 사용
        },
        // 선택된 날짜 스타일링
        selectedBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.tealAccent, // 이미지와 유사한 밝은 녹색
                shape: BoxShape.circle,
              ),
              width: 36.0,
              height: 36.0,
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.black), // 선택된 날짜 텍스트 색상
                ),
              ),
            ),
          );
        },
        // 오늘 날짜 스타일링 (필요시)
        todayBuilder: (context, day, focusedDay) {
          // 오늘 날짜는 특별한 스타일 없이 기본으로 표시
          return Center(child: Text('${day.day}'));
        },
        // 주말 날짜 텍스트 색상
        defaultBuilder: (context, day, focusedDay) {
          if (day.weekday == DateTime.sunday ||
              day.weekday == DateTime.saturday) {
            return Center(
              child: Text(
                '${day.day}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return null; // 기본 스타일 사용
        },
      ),
      // 달력 헤더 스타일링 (요일 표시줄)
      headerStyle: const HeaderStyle(
        formatButtonVisible: false, // '2 weeks', 'month' 버튼 숨김
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 16.0),
        leftChevronVisible: false, // 이전 달 이동 버튼 숨김 (요구사항 상 3월만 표시)
        rightChevronVisible: false, // 다음 달 이동 버튼 숨김 (요구사항 상 3월만 표시)
        headerPadding: EdgeInsets.symmetric(vertical: 8.0), // 헤더 패딩 조정
      ),
      calendarStyle: const CalendarStyle(
        // 기본 날짜 스타일
        defaultTextStyle: TextStyle(color: Colors.black),
        // 주말 날짜 스타일 (dowBuilder에서 색상 지정하므로 여기선 불필요)
        // weekendTextStyle: TextStyle(color: Colors.red),
        // 선택된 날짜 스타일 (selectedBuilder에서 모양과 배경색 지정)
        selectedDecoration: BoxDecoration(
          color: Colors.tealAccent, // selectedBuilder와 일치
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.black,
        ), // selectedBuilder와 일치
        // 오늘 날짜 스타일 (todayBuilder에서 모양 지정)
        todayDecoration: BoxDecoration(
          color: Colors.transparent, // 오늘 날짜 특별한 배경 없음
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(color: Colors.black), // 오늘 날짜 텍스트 색상
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red), // 요일 헤더의 주말 텍스트 색상
      ),
    );
  }
}

// main.dart 파일 등에서 이 스크린을 사용합니다.
// 예시:
// MaterialApp(
//   localizationsDelegates: [
//     GlobalMaterialLocalizations.delegate,
//     GlobalWidgetsLocalizations.delegate,
//     GlobalCupertinoLocalizations.delegate,
//   ],
//   supportedLocales: [
//     const Locale('ko', 'KR'),
//   ],
//   home: VolunteerScheduleScreen(),
// );
