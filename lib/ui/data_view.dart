import 'package:flutter/material.dart';
import 'package:form_app/ui/person.dart';

class ListData extends StatefulWidget {
  late List<Person> persons;

  ListData({required this.persons});

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST PERSONAL DATA')
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20),
        child : Center(
          child: ListView.builder(
            itemCount: widget.persons.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5, // Tambahkan elevasi untuk efek bayangan
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Tambahkan margin
                child: ListTile(
                  title: Text(widget.persons[index].fullName),
                  subtitle: Text(widget.persons[index].address)
                ),
              );
            }
          )
        )
      )
    );
  }
}