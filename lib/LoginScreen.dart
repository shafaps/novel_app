import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'RegisterScreen.dart'; // Ensure path to RegisterScreen is correct
import 'home_screen.dart'; // Ensure path to HomeScreen is correct

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login({String? email, String? password}) async {
    setState(() {
      isLoading = true;
    });

    // If logging in as guest, navigate directly to HomeScreen
    if (email == 'guest') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Use email and password parameters if provided
    final emailValue = email ?? emailController.text;
    final passwordValue = password ?? passwordController.text;

    final response = await http.post(
      Uri.parse('http://192.168.1.16:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailValue,
        'password': passwordValue,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Login successful, token: ${data['token']}');

      // Navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print('Failed to login: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed! Please try again.')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[500]!, // End color
              Colors.blue[400]!, // Start color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center( // Center the content vertically
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Login here',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change to white for better contrast
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome back you’ve been missed!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300], // Lighter grey for contrast
                  ),
                ),
                SizedBox(height: 40),
                Card(
                  elevation: 0, // Remove elevation for flat appearance
                  color: Colors.white, // White background for the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: () => login(),
                                child: Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 15), // Full width button
                                  textStyle: TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                                  ),
                                  backgroundColor: Colors.blue, // Set button color to blue
                                  foregroundColor: Colors.white, // Set text color to white
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Create new account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    login(email: 'guest');
                  },
                  child: Text('Login as Guest (Auto-login)', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
