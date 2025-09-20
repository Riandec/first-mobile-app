import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  String firstName = '';
  String lastName = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? selectGender;
  bool _isChecked = false;
  String? _marriedStatus = 'single';
  bool? _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // first name
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            // last name
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            // gender
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Gender'),
              value: selectGender,
              items: ['male', 'female', 'other']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectGender = value;
                });
              },
            ),
            // married status
            Column(
              children: [
                RadioListTile(
                  title: const Text('single'),
                  value: 'single',
                  groupValue: _marriedStatus,
                  onChanged: (String? value){
                    setState(() {
                      _marriedStatus = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('married'),
                  value: 'married',
                  groupValue: _marriedStatus,
                  onChanged: (String? value){
                    setState(() {
                      _marriedStatus = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('seperated'),
                  value: 'separated',
                  groupValue: _marriedStatus,
                  onChanged: (String? value){
                    setState(() {
                      _marriedStatus = value.toString();
                    });
                  },
                ),
              ],
            ),
            // receive news
            SwitchListTile(
              title: Text('Enable News Notification'),
              activeColor: Colors.purpleAccent,
              value: _isSwitched!, 
              onChanged: (bool value){
                setState(() {
                  _isSwitched = value;
                });
              }
            ),
            // accept terms
            CheckboxListTile(
              title: Text('Accept Terms and Conditions'),
              activeColor: Colors.purpleAccent,
              value: _isChecked, 
              onChanged: (bool? value){
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            
            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('First Name: ${_firstNameController.text}');
                      print('Last Name: ${_lastNameController.text}');
                    }
                  },
                  child: Text('submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _firstNameController.clear();
                    _lastNameController.clear();
                  },
                  child: Text('clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _firstNameController.text = 'Dev';
                    _lastNameController.text = 'Shubert';
                  },
                  child: Text('auto fill'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.purpleAccent,
              child: Text(
                'Name: $firstName $lastName',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exercise I
class FormExercise extends StatefulWidget {
  const FormExercise({super.key});

  @override
  State<FormExercise> createState() => _FormExerciseState();
}

class _FormExerciseState extends State<FormExercise> {
  String fullName = '';
  String email = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? gender;
  String? province;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Form(
        key: _formKey,        
        child: Column(
          children: [
            // full name
            TextFormField(
              controller: _fullNameController,              
              decoration: const InputDecoration(labelText: 'Full Name'),
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            // email
            TextFormField(
              controller: _emailController,              
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            // gender
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gender'),
                Row(
                  children: [
                    Expanded(
                      child:
                      RadioListTile(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (String? value){
                          setState(() {
                              gender = value.toString();
                          });
                        },
                      ),
                    ),
                    
                    Expanded(
                      child:
                      RadioListTile(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (String? value){
                          setState(() {
                              gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // province
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Province'),
              value: province,
              items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  province = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your province';
                }
                return null;
              },
            ),
            // accept terms
            CheckboxListTile(
              title: Text('Accept Terms and Conditions'),
              value: _isChecked, 
              onChanged: (bool? value){
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          
            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      print('Success');
                      print('Full Name: ${_fullNameController.text}');
                      print('Email: ${_emailController.text}');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}