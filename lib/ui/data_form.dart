import 'package:flutter/material.dart';
import 'package:form_app/ui/data_view.dart';

class PersonalForm extends StatefulWidget { 
  const PersonalForm({Key? key}) : super(key: key);
  @override _PersonalFormState createState() => _PersonalFormState();
}


class _PersonalFormState extends State<PersonalForm> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _personalIdController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime? _birthDate;

  
  bool isVerificationDone= false;
  String inputValue = '';
  bool isPhoneNumberValid = false;
  bool agreeToTerms = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

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
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
                Icons.sticky_note_2,
                color: Colors.black
              )
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget >[
            _textboxFullName(),
            _textboxEmail(),
            _textboxPhone(),
            _textboxPersonalID(),
            _textboxAddress(),
            _inputCalendar(),
            _checkboxAgree(),
            _tombolSimpan()
          ].map((widget) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: widget
            )).toList()
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
            controller: _fullNameController
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
            controller: _emailController
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
                  onChanged: (value) {
                    setState(() {
                      isPhoneNumberValid = value.isNotEmpty;
                    });
                  },
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
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10),  
                  ),
                  controller: _phoneNumberController
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
                  onPressed: isPhoneNumberValid? () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Verification'),
                                    content: Text('Verification Berhasil'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                            setState(() {
                              isVerificationDone = true; // Set verifikasi selesai menjadi true
                            });
                          }
                        : null,
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
              ]
            )  
          ],
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
            controller: _personalIdController
          )
        ]
      )
    );  
  }

  _textboxAddress() {
    return Column(
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
            controller: _addressController
          )
        ]
    );
  }

   _checkboxAgree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: agreeToTerms,
          onChanged: (bool? value){
            setState(() {
              agreeToTerms = value ?? false;
            });
          }
        ),
        Expanded(
          child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            textAlign: TextAlign.justify,
          )
        )
      ]
    );  
  }

  _inputCalendar() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Choose a Date',
              style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Chivo',
                  fontWeight: FontWeight.w400,
                  height: 0,
              ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))

            ),
            child: ListTile(
              title: Text(_birthDate == null ? "Select Date" : "${_birthDate?.toLocal()}".split(' ')[0]),
              titleTextStyle: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () {
                _selectDate(context);
              },
            )
          )
        ]
    );
  }


  _tombolSimpan() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
            onPressed: () {
              String fullName = _fullNameController.text;
              String email = _emailController.text;
              String phone = _phoneNumberController.text;
              String personalId = _personalIdController.text;
              String address = _addressController.text;
              String date = "${_birthDate?.toLocal()}".split(' ')[0];
              
              Navigator
                .of(context)
                .push(MaterialPageRoute(
                  builder: (context) => ListData(
                      fullName: fullName,
                      email: email,
                      phone: phone,
                      personalId: personalId,
                      address: address,
                      date: date,
                    )
                  )
                );
            },
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
