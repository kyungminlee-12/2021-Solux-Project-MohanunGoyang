import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/provider/join_or_login_notifier.dart';
import 'package:mohanun_goyang/screen/setProfile_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _logoImage,
            Stack(
              children: [
                _inputForm(size),
                _authButton(size),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Consumer<JoinOrLogin>(
              builder: (context, joinOrLogin, child) => GestureDetector(
                onTap: () {
                  joinOrLogin.toggle();
                },
                child: Text(
                  joinOrLogin.isJoin
                      ? "Already Have an Accout? Sign in"
                      : "Don't Have an Accout? Create One",
                  style: TextStyle(
                      color: joinOrLogin.isJoin ? Colors.red : Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ],
    ));
  }

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => setProfile()),
    );

    final User? user = result.user;

    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    userCollection.doc(user!.uid).set({
      'email': _emailController.text,
    });

    if (user == null) {
      final snacBar = SnackBar(
        content: Text("Please try again later."),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: snacBar));
    }
  }

  void _login(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text("Please try again later."),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: snacBar));
    }
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 120, bottom: 20, left: 40, right: 40),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/image.jpeg"),
            ),
          ),
        ),
      );

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.1,
      right: size.width * 0.1,
      bottom: 0,
      child: Consumer<JoinOrLogin>(
        builder: (context, joinOrLogin, child) => ElevatedButton(
            child: Text(
              joinOrLogin.isJoin ? "Join" : "Login",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
              primary: joinOrLogin.isJoin ? Color(0xffff4f84) : Colors.brown,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                joinOrLogin.isJoin ? _register(context) : _login(context);
              }
            }),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input correct email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input correct password.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (context, joinOrLogin, child) => Opacity(
                        opacity: joinOrLogin.isJoin ? 0 : 1,
                        child: Text("Forgot Password")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
