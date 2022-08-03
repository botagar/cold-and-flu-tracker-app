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
      body: generateListViewBody(),
    );
  }

  Widget generateListViewBody() {
    return FutureBuilder(
      initialData: const Center(
          child: Icon(
        Icons.list_outlined,
        color: Colors.white,
        size: 35,
      )),
      future: infectionService.getCurrentInfection(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data is Infection
              ? (snapshot.data as Infection).records.length
              : 1,
          itemBuilder: (context, index) {
            if (snapshot.data is! Infection) {
              return const Text("Loading");
            }
            var infection = snapshot.data as Infection;

            return InfectionListElement(
              infection: infection,
            );
          },
        );
      },
    );
  }
}
