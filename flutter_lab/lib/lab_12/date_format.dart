import 'package:flutter/material.dart';

class DateFormat extends StatefulWidget {
  const DateFormat({super.key});

  @override
  State<DateFormat> createState() => _DateFormatState();
}

class _DateFormatState extends State<DateFormat> {
  String dob = "Select DOB";
  DateTime? date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date Formates",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: InkWell(
        child: Text(dob),
        onTap: () async {
          date = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2005),
            lastDate: DateTime(2025),
          );
          dob = "${date!.day}-${date!.month}-${date!.year}";
          setState(() {});

        },

      ),
    );
  }
}
