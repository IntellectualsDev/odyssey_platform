import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Row(children: [
        const Text("My Games", style: TextStyle(),),
        const Text("Store", style: TextStyle()),
        const Spacer(),
        ElevatedButton(onPressed: (() => {}), child: const Text("Sign up/Log in", style: TextStyle(),))
      ],)
    ],),);
  }
}




