import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDisplay extends StatelessWidget {
  final DateTime dateTime;
  final bool showDate;
  final bool showTime;

  const DateTimeDisplay(
      {Key? key,
      required this.dateTime,
      required this.showDate,
      required this.showTime})
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

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(4),
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
