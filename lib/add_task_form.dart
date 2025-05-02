import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskForm extends StatefulWidget {
  AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() {
    // TODO: implement createState
    return _AddTaskFormState();
  }
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formkey = GlobalKey<FormState>();
  final taskTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 40, 50),
        foregroundColor: Colors.white,
        title: Text(
          'Create new task',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task title',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 69, 90, 100),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                  ),
                ),
                controller: taskTitle,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 4) {
                    return "task title must be 4 characters long";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
