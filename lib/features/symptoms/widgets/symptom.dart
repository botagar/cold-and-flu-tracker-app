import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart' as dao;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Symptom extends StatefulWidget {
  final String title;
  final String defaultExplainerText;
  final Map<int, String> explainerText;
  final void Function(dao.Symptom symptom)? onSymptomUpdate;

  const Symptom(
      {Key? key,
      this.title = "New Symptom",
      this.defaultExplainerText = "Not experiencing this symptom.",
      this.explainerText = const {},
      this.onSymptomUpdate})
      : super(key: key);

  @override
  State<Symptom> createState() => _SymptomState();
}

class _SymptomState extends State<Symptom> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                widget.explainerText[_rating] ?? widget.defaultExplainerText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Slider.adaptive(
                  value: _rating,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: "$_rating",
                  onChanged: (double value) {
                    setState(() {
                      _rating = value;
                    });
                    if (widget.onSymptomUpdate != null) {
                      widget.onSymptomUpdate!(
                        dao.Symptom(
                            id: const Uuid().v4(),
                            name: widget.title,
                            rating: value.toInt(),
                            dateOfSymptom: DateTime.now(),
                            explainerText: widget.explainerText[_rating] ??
                                widget.defaultExplainerText),
                      );
                    }
                  }),
            )
          ],
        ),
      ],
    );
  }
}
