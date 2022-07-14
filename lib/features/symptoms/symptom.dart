import 'package:flutter/material.dart';

class Symptom extends StatefulWidget {
  final String title;
  final String defaultExplainerText;
  final Map<int, String> explainerText;

  const Symptom(
      {Key? key,
      this.title = "New Symptom",
      this.defaultExplainerText = "Not experiencing this symptom",
      this.explainerText = const {}})
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
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Row(
          children: [
            Text(widget.explainerText[_rating] ?? widget.defaultExplainerText)
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Slider(
                  value: _rating,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: "$_rating",
                  onChanged: (double value) {
                    setState(() {
                      _rating = value;
                    });
                  }),
            )
          ],
        ),
      ],
    );
  }
}
