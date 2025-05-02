import 'package:daytask/data_models/todo_item.dart';
import 'package:daytask/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<TodoItem> taskList = [
  TodoItem(
      date: DateTime.now(),
      title: "Mobile app wireframe",
      status: false,
      subtasks: []),
  TodoItem(
      date: DateTime.now(),
      title: "Mobile app wireframe",
      status: false,
      subtasks: []),
];

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 254, 211, 106),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            'Kevin Debruyne',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 56,
            child: TextField(
              cursorColor: Color.fromARGB(255, 111, 135, 147),
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
              )),
              controller: searchController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 111, 135, 147),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 69, 90, 100),
                hintText: 'Search tasks',
                hintStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 111, 135, 147),
                    fontSize: 16,
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 2, right: 2),
                  child: Icon(
                    Icons.search_outlined,
                    color: Color.fromARGB(255, 111, 135, 147),
                    size: 24,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongoing Tasks',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'See all',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 254, 211, 106),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          TaskCard(taskInfo: taskList[0]),
        ],
      ),
    );
  }
}
