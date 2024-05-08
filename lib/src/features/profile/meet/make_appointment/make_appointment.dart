import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/profile/meet/make_appointment/model/meeting_model.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<MeetingModel>> meetings = {};

  @override
  void initState() {
    // TODO: implement initState
    _selectedDay = _focusedDay;
    super.initState();
  }

  List freeTime = ['9.30', '10.20', '11.10'];
  List<bool> isTimeSelected = [false, false, false];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Назначить встречу',
        text_color: AppColors.primary_color,
        background_color: AppColors.white_color,
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primary_color,
        ),
      ),
      backgroundColor: AppColors.white_color,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2080, 3, 14),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: calendarFormat,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle:
                    TextStyle(color: AppColors.primary_color, fontSize: 25),
              ),
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: AppColors.low_primary_color,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppColors.primary_color,
                  shape: BoxShape.circle,
                ),
              ),
              // eventLoader: (day) {
              //   //  return _getEventsForDay(day);
              // },
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 40,
                ),
                itemCount: freeTime.length,
                itemBuilder: (context, index) {
                  return CommonButton(
                    padding: 0,
                    pad_size: 0,
                    borderRad: 25,
                    borderWidth: 1.5,
                    fntSize: 16,
                    border_color: isTimeSelected[index]
                        ? AppColors.primary_color
                        : AppColors.grey_color,
                    background_color: AppColors.white_color,
                    text_color: isTimeSelected[index]
                        ? AppColors.primary_color
                        : AppColors.grey_color,
                    onTap: () {
                      setState(() {
                        isTimeSelected[index] = !isTimeSelected[index];
                      });
                    },
                    text: freeTime[index],
                  );
                },
              ),
            ),
            CommonButton(onTap: () {}, text: 'Записаться'),
          ],
        ),
      ),
    );
  }
}
