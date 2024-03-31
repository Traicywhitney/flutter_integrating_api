import 'package:flutter/material.dart';
import 'package:flutter_lesson_method/model/program_model.dart';
import 'package:flutter_lesson_method/services/program_sevices.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  late List<Items> _programs = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    try {
      ProgramModel response = await ProgramApiService.fetchLessons();
      setState(() {
        _programs = response.items!;
      });
    } catch (e) {
      print('Error loading lessons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Programs'),
          backgroundColor: Color(0xFFB2D2A4),
        ),
        body: _programs == null || _programs.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _programs!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Id : ${_programs[index].id}'),
                          subtitle:
                              Text('createdAt : ${_programs[index].createdAt}'),
                        ),
                        ListTile(
                          title: Text('Name: ${_programs[index].name}'),
                        ),
                        ListTile(
                          title:
                              Text('Category : ${_programs[index].category}'),
                        ),
                        ListTile(
                          title: Text('Lesson : ${_programs[index].lesson}'),
                        ),
                        ListTile(
                          title: Text(
                              'UserName: ${_programs[index].userName != null ? _programs[index].userName! : '-'}'),
                        ),
                        ListTile(
                          title: Text(
                              'MobileNo :${_programs[index].mobileNo != null ? _programs[index].mobileNo! : '-'}'),
                        ),
                        ListTile(
                          title: Text(
                              'EmailId: ${_programs[index].emailId != null ? _programs[index].emailId! : '-'}'),
                        ),
                        ListTile(
                          title: Text(
                              'City: ${_programs[index].city != null ? _programs[index].city! : '-'}'),
                        ),
                        ListTile(
                          title: Text(
                              'Password: ${_programs[index].password != null ? _programs[index].password! : '-'}'),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
