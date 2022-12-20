import 'package:flutter/material.dart';
import 'package:sandwech/utils/GNav.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Ciao, Alessio"),
      ),
      bottomNavigationBar: GNavi(1),
    );
  }
}
