import 'package:cold_flu_tracker_app/common/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bool _isEditingText = false;
  late final TextEditingController _editingController;
  final String initialText = "Initial Text";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      bottomNavigationBar: BottomNavBar.build(context),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return TextField(
              // controller: _editingController,
              );
        },
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 4,
        ),
      ),
    );
  }
}
