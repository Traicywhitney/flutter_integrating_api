import 'package:flutter/material.dart';
import 'package:flutter_lesson_method/model/lesson_model.dart';
import 'package:flutter_lesson_method/services/lesson_service.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<LessonScreen> {
  late List<Items> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    try {
      LessonModel response = await LessonApiService.fetchLessons();
      setState(() {
        _lessons = response.items!;
      });
    } catch (e) {
      print('Error loading lessons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lessons'),
          backgroundColor: Color(0xFFB2D2A4),
        ),
        body: _lessons == null || _lessons.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _lessons!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Id : ${_lessons[index].id}'),
                          subtitle:
                              Text('createdAt : ${_lessons[index].createdAt}'),
                        ),
                        ListTile(
                          title: Text('Name : ${_lessons[index].name}'),
                        ),
                        ListTile(
                          title: Text('Category : ${_lessons[index].category}'),
                        ),
                        ListTile(
                          title: Text('Duration : ${_lessons[index].duration}'),
                        ),
                        ListTile(
                          title: Text('Locked : ${_lessons[index].locked}'),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
