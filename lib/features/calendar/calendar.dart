import 'package:cold_flu_tracker_app/features/calendar/calendar_service.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarService calendarService = CalendarService();

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    Widget _scoredBackground(
        BuildContext context,
        DateTime day,
        DateTime focusedDay,
        Color textColor,
        Color backgroundColor,
        bool isFocused) {
      int alpha = (calendarService.getSicknessRatingForDay(day) * 255).toInt();
      var color = backgroundColor.withAlpha(alpha);

      Border? borderStyle;
      BorderRadiusGeometry? borderRadius;
      BoxShape shape = BoxShape.rectangle;
      if (isFocused) {
        borderStyle = Border.all(width: 1);
        shape = BoxShape.circle;
      }

      return Container(
        decoration: BoxDecoration(
          color: color,
          border: borderStyle,
          borderRadius: borderRadius,
          shape: shape,
        ),
        child: Center(
          child: Text(
            day.day.toString(),
            style: TextStyle(color: textColor),
          ),
        ),
      );
    }

    return TableCalendar(
      firstDay: DateTime.utc(2018, 1, 1),
      lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      focusedDay: DateTime.now(),
      headerVisible: true,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarFormat: _calendarFormat,
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() => _calendarFormat = format);
        }
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder:
            (BuildContext context, DateTime day, DateTime focusedDay) {
          return _scoredBackground(
              context, day, focusedDay, Colors.blue, Colors.red, false);
        },
        // selectedBuilder:
        //     (BuildContext context, DateTime day, DateTime focusedDay) {
        //   return _scoredBackground(
        //       context, day, focusedDay, Colors.blue, Colors.red, true);
        // },
        // todayBuilder:
        //     (BuildContext context, DateTime day, DateTime focusedDay) {},
        outsideBuilder:
            (BuildContext context, DateTime day, DateTime focusedDay) {
          return _scoredBackground(context, day, focusedDay, Colors.grey,
              const Color.fromARGB(255, 255, 154, 71), false);
        },
      ),
    );
  }
}
