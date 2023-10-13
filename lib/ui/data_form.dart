import 'package:flutter/material.dart';
import 'package:form_app/ui/data_view.dart';

class PersonalForm extends StatefulWidget { 
  const PersonalForm({Key? key}) : super(key: key);
  @override _PersonalFormState createState() => _PersonalFormState();
}


class _PersonalFormState extends State<PersonalForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERSONAL FORM',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Chivo',
              fontWeight: FontWeight.w700,
              height: 0,
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxFullName(),
            _textboxEmail(),
            _textboxPhone(),
            _textboxPersonalID(),
            _textboxAddress(),
            _inputCalendar(),
            _checkboxAgree(),
            _tombolSimpan()
          ].map((widget) =>  Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: widget,
            )).toList()
          ,
        ),
      ),
    );
  }

  _textboxFullName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Full Name',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Full Name",
              hintStyle: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10)
            ),
            controller: _kodeProdukTextboxController
          )
        ]
      )
    );
    
  }

  _textboxEmail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Email',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Email",
              hintStyle: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10)
            ),
            controller: _kodeProdukTextboxController
          )
        ]
      )
    );  
  }

  _textboxPhone() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Phone Number',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 14,
                      fontFamily: 'Chivo',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10)
                  ),
                  controller: _kodeProdukTextboxController
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  // onPressed: () {
                  //   String kodeProduk = _kodeProdukTextboxController.text;
                  //   String namaProduk = _namaProdukTextboxController.text;
                  //   int harga = int.parse(_hargaProdukTextboxController.text);
                    
                  //   Navigator
                  //     .of(context)
                  //     .push(MaterialPageRoute(
                  //       builder: (context) => ProdukDetail(
                  //           kodeProduk: kodeProduk,
                  //           namaProduk: namaProduk,
                  //           harga: harga,
                  //         )
                  //       )
                  //     );
                  // },
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    padding: EdgeInsets.all(10)
                  ),
                  child: const Text('Verify')
                )
              )
              
            ],
          )
          
        ]
      )
    );
    
  }

_textboxPersonalID() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Personal ID Number',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Value",
              hintStyle: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10)
            ),
            controller: _kodeProdukTextboxController
          )
        ]
      )
    );  
  }

  _textboxAddress() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Address',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Address",
              hintStyle: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10)
            ),
            controller: _kodeProdukTextboxController
          )
        ]
      )
    );  
  }

   _checkboxAgree() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: false,
          onChanged: null
        ),
        Expanded(
          child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            textAlign: TextAlign.justify,
          )
        )
      ]
    );  
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _inputCalendar() {
    return ListTile(
      title: Text("Choose a Date"),
      subtitle: _selectedDate == null ?
        Text("Select Date") : Text("${_selectedDate}".split('')[0]),
      trailing: Icon(Icons.calendar_today),
      onTap: () => _selectDate(context),
    );
  }


  _tombolSimpan() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
            // onPressed: () {
            //   String kodeProduk = _kodeProdukTextboxController.text;
            //   String namaProduk = _namaProdukTextboxController.text;
            //   int harga = int.parse(_hargaProdukTextboxController.text);
              
            //   Navigator
            //     .of(context)
            //     .push(MaterialPageRoute(
            //       builder: (context) => ProdukDetail(
            //           kodeProduk: kodeProduk,
            //           namaProduk: namaProduk,
            //           harga: harga,
            //         )
            //       )
            //     );
            // },
            onPressed: null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            
            child: const Text('Simpan')
          )
    );
  }
}
