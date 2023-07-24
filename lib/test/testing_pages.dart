// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/test/password_field.dart'; // Replace with the actual path to your PasswordField widget

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String? _hashedPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: PasswordField(
                errorText: _hashedPassword == null
                    ? "Please enter at least 8 charecters"
                    : null,
                onPasswordChanged: (password) {
                  setState(() {
                    _hashedPassword = password;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_hashedPassword == null) {
            print("Please enter the password.");
          } else {
            // Here you would perform actual authentication with the server or local logic.
            // For this example, we'll assume the correct password is 'example123'.
            if (_hashedPassword == 'aaaaaaaa') {
              print("Login Successful!");
            } else {
              print("Invalid Password!");
            }
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
