import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_testing/screens/login_page.dart';
import 'package:flutter_application_testing/services/firebase_auth_service.dart';
import 'firebase_controllers.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // create parameters.
  //form key
  final _formkey = GlobalKey<FormState>();
  // define editing controller
  // final firstNameEditingController = TextEditingController();
  // final secondNameEditingController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //fields.

    //first name field
    // final firstNameField = TextFormField(
    //   autofocus: false,
    //   controller: firstNameEditingController,
    //   keyboardType: TextInputType.name,
    //   //validator: (value) {},
    //   onSaved: (value) {
    //     firstNameEditingController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //     prefixIcon: Icon(Icons.person),
    //     contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     hintText: "first Name",
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    //   ),
    // );

    //email validation
    @override
    void dispose() {
      _emailController.dispose();

      super.dispose();
    }

    // second name
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      //validator: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter full names";
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "full  Names",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // email field
    final emailField = TextFormField(
      autofillHints: const [AutofillHints.email], //added this
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return " please enter a valid email";
        }
        return null;
      },

      onSaved: (value) {
        setState(() {
          _emailController.text = value!;
        });
        //emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // password field

    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      //keyboardType: TextInputType.visiblePassword,
      //validator: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter password";
        }
        return null;
      },
      obscureText: true,
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // confirm password

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      //keyboardType: TextInputType.visiblePassword,
      //validator: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please re enter your password";
        }
        if (confirmPasswordEditingController.text != _passwordController.text) {
          return "passwords do not match";
        }
        return null;
      },
      obscureText: true,
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " confirm password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    //sign up button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        //
        onPressed: () async {
          var email = _emailController.text.trim();
          var password = _passwordController.text.trim();
          var confirmPassword = confirmPasswordEditingController.text.trim();
          print(confirmPassword);
          print(email);
          print(password);
          //testing
          try {
            await FirebaseAuthService().signup(
                _emailController.text.trim(), _passwordController.text.trim());

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          } on FirebaseException catch (e) {
            debugPrint("error is ${e.message}");

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Alert dialogue box"),
                content: const Text(
                    "Make sure you fill in all the required  detail ,Make sure Email is formatted correctly ie. me@gmail.com,Make sure the Password and confirm password match,If you already created an account login"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          }
        },
        child: Text(
          "sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            //passing this to our root.
            Navigator.of(context).pop();
          },
        ),
      ),
      //wrap with padding.
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Form(
                //takes in form key, column ,children .
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    //firstNameField,
                    //SizedBox(height: 45),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(
                      height: 35,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
