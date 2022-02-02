import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class setProfile extends StatefulWidget {
  _setProfileState createState() => _setProfileState();
}

class _setProfileState extends State<setProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController userNameController = TextEditingController();

  // late String? userName = FirebaseAuth.instance.currentUser!.displayName;
  User? user = FirebaseAuth.instance.currentUser;

  submitUserName() {
    // final form = _formKey.currentState;
    // if (form!.validate()) {

    // form!.save();
    user!.updateDisplayName(userNameController.text);
    user!.reload();
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Form(
              key: _formKey,
              child: TextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value!.trim().length < 5 || value!.isEmpty) {
                    return "User Name is too short";
                  } else if (value!.trim().length > 15 || value!.isEmpty) {
                    return "User Name is too long";
                  } else {
                    return null;
                  }
                },
                // onSaved: (value) => userName = value!,
              )),
        ),
        ElevatedButton(
            child: Text(
              "Submit",
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                submitUserName();
              }
            }),
      ],
    ));
  }
}
