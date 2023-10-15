import 'package:flutter/material.dart';
import 'package:testproject/screens/home_screens.dart';

class Iconplay extends StatefulWidget {
  const Iconplay({super.key});

  @override
  State<Iconplay> createState() => _IconplayState();
}

class _IconplayState extends State<Iconplay> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Homescreen()),
  );
    }, icon: Icon(Icons.play_arrow,size: 70,));
  }
}
// Within the `FirstRoute` widget
