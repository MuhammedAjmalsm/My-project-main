import 'package:flutter/material.dart';

class dateofbirth extends StatefulWidget {
  const dateofbirth({super.key});

  @override
  State<dateofbirth> createState() => _dateofbirthState();
}

class _dateofbirthState extends State<dateofbirth> {
  DateTime? selcteddate;
  Future<void> pickdate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2029),
    );

    if (picked != null) {
      setState(() {
        selcteddate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            selcteddate == null
                ? "not selected"
                : "${selcteddate!.day}/${selcteddate!.month}",
          ),
          Center(
            child: IconButton(
              onPressed: pickdate,
              icon: Icon(Icons.date_range),
            ),
          ),
        ],
      ),
    );
  }
}
