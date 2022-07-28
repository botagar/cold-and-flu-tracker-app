import 'package:cold_flu_tracker_app/common/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_list_element.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_service.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var infectionService = InfectionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Records"),
      ),
      bottomNavigationBar: BottomNavBar.build(context),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return InfectionListElement(
              infection: Infection(
                  id: "",
                  startOfInfection: DateTime.now(),
                  endOfInfection: DateTime.now()));
        },
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 4,
        ),
      ),
    );
  }
}
