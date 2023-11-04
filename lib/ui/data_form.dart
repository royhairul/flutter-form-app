import 'package:flutter/material.dart';
import 'package:form_app/ui/data_view.dart';
import 'package:form_app/ui/person.dart';

class PersonalForm extends StatefulWidget { 
  const PersonalForm({Key? key}) : super(key: key);
  @override _PersonalFormState createState() => _PersonalFormState();
}


class _PersonalFormState extends State<PersonalForm> {
  final List<Person> persons = [];

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
              fontWeight: FontWeight.w700
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.sticky_note_2,
                color: Colors.black
            ),
            onPressed: () {
              Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => ListData(persons: persons)
                  ));
            },
          )
        ],
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
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
              padding: const EdgeInsets.only(bottom: 10),
              child: widget
            )).toList()
        ),
      ),
    );
  }

  TextStyle labelTextStyle() {
    return const TextStyle(
        color: Color(0xFF2A2A2A),
        fontSize: 14,
        fontFamily: 'Chivo',
        fontWeight: FontWeight.w400,
        height: 0,
      );
  }

  TextStyle placeholderStyle() {
    return const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
    );
  }

  InputDecoration defaultInputDecor(String placeholder) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: placeholder,
      hintStyle: placeholderStyle(),
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 8, 10)
    );
  }

  _textboxFullName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Full Name',
              style: labelTextStyle(),
          ), 
          TextField(
            decoration: defaultInputDecor("Enter Your Full Name"),
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
          Text(
              'Email',
              style: labelTextStyle(), 
          ),
          TextField(
            decoration: defaultInputDecor("Enter Your Email"),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
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
          Text(
              'Phone Number',
              style: labelTextStyle(),
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
                  decoration: defaultInputDecor("Enter Your Phone Number"),
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: ElevatedButton(
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
          Text(
              'Personal ID Number',
              style: labelTextStyle(),
          ),
          TextField(
            decoration: defaultInputDecor("Enter Your Personal ID"),
            controller: _personalIdController,
            keyboardType: TextInputType.number
          )
        ]
      )
    );  
  }

  _textboxAddress() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Address',
              style: labelTextStyle(),
          ),
          TextField(
            decoration: defaultInputDecor("Enter Your Address"),
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
        const Expanded(
          child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 10,
            )
          )
        )
      ]
    );  
  }

  _inputCalendar() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Birth Date',
              style: labelTextStyle()
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
              titleTextStyle: TextStyle(
                color: _birthDate == null ? Color(0xFF9E9E9E) : Colors.black,
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
      child: ElevatedButton (
            onPressed: () {
              Person newPerson = Person(
                fullName: _fullNameController.text,
                email: _emailController.text,
                phoneNumber:  _phoneNumberController.text,
                personalId: _personalIdController.text,
                address: _addressController.text,
                birthDate: "${_birthDate?.toLocal()}".split(' ')[0]
              );

              persons.add(newPerson);

              _fullNameController.clear();
              _emailController.clear();
              _phoneNumberController.clear();
              _personalIdController.clear();
              _addressController.clear();
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
