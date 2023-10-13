import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  final String? fullName;
  final String? email;
  final String? personalId;
  final String? phone;
  final String? address;
  final String? date;

  const ListData({
    Key? key,
    this.fullName,
    this.email,
    this.personalId,
    this.phone,
    this.address,
    this.date

  }) : super(key: key);

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST PERSONAL DATA')
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              _showKodeProduk(screenWidth)
            ]
            .map((widget) => Padding(
                padding: const EdgeInsets.only(left: 30),
                child: widget
              )).toList()
            )
          )
      );
    }


  _showKodeProduk(sWidth) {
    return Container(
      width: (sWidth - 55.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0), // Border
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ], // Shadow
        borderRadius: BorderRadius.circular(12.0), // Border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, 
        children: [
          Text(
            widget.fullName.toString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
            ),
          ),
          Text(
            widget.address.toString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
            ),
          ),
          Text(
              'Email : ${widget.email}',
              style: TextStyle(
                color: Color(0xFF4A3CE4),
                fontSize: 10,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
          )
        ]
      )
    );
  }

}