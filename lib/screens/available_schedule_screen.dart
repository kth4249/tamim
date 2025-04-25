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
  // 선택된 날짜들을 관리하기 위한 Set
  final Set<DateTime> _selectedDays = {
    DateTime.utc(2024, 3, 5),
    DateTime.utc(2024, 3, 13),
    DateTime.utc(2024, 3, 20),
  };
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
    final selectedDays = availableDateByMember.isEmpty
        ? []
        : availableDateByMember
            .firstWhere((element) => element.id == selectedMemberId)
            .memberDates;
    // 선택된 날짜 목록을 문자열로 변환 (예: "3월 5일, 13일, 20일")
    String selectedDaysText = selectedDays.isNotEmpty
        ? DateFormat('M월 d일', 'ko_KR').format(selectedDays.first) +
            selectedDays
                .skip(1)
                .map((day) => DateFormat('d일', 'ko_KR').format(day))
                .join(', ')
        : '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('봉사 가능일 선택'),
      ),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // 제출 로직 구현
            print('Selected days: $_selectedDays');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('선택된 날짜: $selectedDaysText')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // 버튼 색상
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('제출하기', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  // 달력 헤더 (년월, 전체선택, 선택해제)
  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('yyyy년 M월', 'ko_KR').format(_focusedDay),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            TextButton(
              onPressed: _selectAllVisibleDays,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(50, 30),
              ),
              child: const Text('전체 선택'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedDays.clear();
                });
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(50, 30),
              ),
              child: const Text('선택 해제'),
            ),
          ],
        ),
      ],
    );
  }

  // 달력 위젯 생성
  Widget _buildCalendar() {
    final availableDateByMember =
        context.watch<VolunteerScheduleProvider>().availableDateByMember;
    final selectedMemberId =
        context.watch<VolunteerScheduleProvider>().selectedMemberId;
    final selectedDays = availableDateByMember
        .firstWhere((element) => element.id == selectedMemberId)
        .memberDates;
    return TableCalendar<DateTime>(
      locale: 'ko_KR',
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      // selectedDayPredicate: (day) => _selectedDays.contains(day),
      selectedDayPredicate: (day) {
        var flag = false;
        for (var d in selectedDays) {
          if (isSameDay(d, day)) {
            flag = true;
          }
        }
        return flag;
      },
      onDaySelected: (selectedDay, focusedDay) {
        // context.read<VolunteerScheduleProvider>().changeDate(selectedDay);
        setState(() {
          _focusedDay = focusedDay; // 사용자가 다른 월로 이동하면 포커스 업데이트
          // 선택 로직: 이미 선택된 날짜면 제거, 아니면 추가
          if (_selectedDays.contains(selectedDay)) {
            _selectedDays.remove(selectedDay);
          } else {
            _selectedDays.add(selectedDay);
          }
        });
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

  // 현재 보이는 달의 모든 날짜를 선택하는 함수
  void _selectAllVisibleDays() {
    setState(() {
      _selectedDays.clear();
      // 현재 포커스된 달의 시작과 끝 날짜 계산
      final firstDayOfMonth = DateTime.utc(
        _focusedDay.year,
        _focusedDay.month,
        1,
      );
      final lastDayOfMonth = DateTime.utc(
        _focusedDay.year,
        _focusedDay.month + 1,
        0,
      );

      for (DateTime day = firstDayOfMonth;
          day.isBefore(lastDayOfMonth.add(const Duration(days: 1)));
          day = day.add(const Duration(days: 1))) {
        // lastDay은 3월 31일이어야 함 (DateTime.utc(2024, 3, 31))
        // lastDay 생성 시 주의 필요
        if (day.month == _focusedDay.month) {
          // 다른 달 날짜는 포함하지 않음
          _selectedDays.add(day);
        }
      }
    });
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
