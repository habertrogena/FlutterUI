import 'package:flutter/material.dart';

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
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
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
    // second name
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      //validator: (value) {},
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
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: (value) {},
      onSaved: (value) {
        emailEditingController.text = value!;
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
      controller: passwordEditingController,
      //keyboardType: TextInputType.visiblePassword,
      //validator: (value) {},
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
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
        onPressed: () {},
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
