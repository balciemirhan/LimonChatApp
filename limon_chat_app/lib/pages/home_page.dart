import 'package:flutter/material.dart';

import 'package:limon_chat_app/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 249, 191),
        centerTitle: true,
        title: const Text("Home"),
      ),
      // drawer
      drawer: const MyDrawer(),
    );
  }
}
