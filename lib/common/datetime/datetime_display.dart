import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDisplay extends StatelessWidget {
  final DateTime dateTime;
  final bool showDate;
  final bool showTime;
  final bool foreground;

  const DateTimeDisplay(
      {Key? key,
      required this.dateTime,
      this.showDate = true,
      this.showTime = true,
      this.foreground = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dtFormatStringBuffer = StringBuffer();
    if (showDate) {
      dtFormatStringBuffer.write('yyyy/MM/dd ');
    }
    if (showTime) {
      dtFormatStringBuffer.write('hh:mm a');
    }
    String dateTimeText =
        DateFormat(dtFormatStringBuffer.toString().trim()).format(dateTime);

    // TODO: Use Foreground paramter to make text black or grey

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4, right: 6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromARGB(255, 225, 225, 225),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(dateTimeText,
                style: Theme.of(context).textTheme.bodySmall),
          )
        ]),
      ),
    );
  }
}
