import 'package:flutter/material.dart';

class DateFormat extends StatefulWidget {
  const DateFormat({super.key});

  @override
  State<DateFormat> createState() => _DateFormatState();
}

class _DateFormatState extends State<DateFormat> {
  int age = 0;
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
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Column(
                children: [
                  Text(
                    dob,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Age = $age",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              onTap: () async {
                date = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1991),
                  lastDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                );

                dob = "${date!.day}-${date!.month}-${date!.year}";
                age = DateTime.now().year - date!.year;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
