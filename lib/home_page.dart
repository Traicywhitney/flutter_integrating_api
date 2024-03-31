import 'package:flutter/material.dart';
import 'package:flutter_lesson_method/screen/lesson_screen.dart';
import 'package:flutter_lesson_method/screen/program_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        backgroundColor: Color(0xFFB2D2A4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side:
                          BorderSide(color: Color(0xFFB2D2A4)), // Outline color
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProgramScreen()));
                },
                child: Text(
                  'Programs',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side:
                          BorderSide(color: Color(0xFFB2D2A4)), // Outline color
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LessonScreen()));
                },
                child: Text(
                  'Lessons',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
