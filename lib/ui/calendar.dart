import 'package:flutter/material.dart';

class MyDatePickerApp extends StatefulWidget {
  @override
  _MyDatePickerAppState createState() => _MyDatePickerAppState();
}

class _MyDatePickerAppState extends State<MyDatePickerApp> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Tanggal Lahir'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Tanggal Lahir: ${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Pilih Tanggal Lahir'),
            ),
          ],
        ),
      ),
    );
  }
}