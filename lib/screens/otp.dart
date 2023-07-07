import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:lottie/lottie.dart';

import 'bbar.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                color: primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_3mcu1lCXFW.json'),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                textStyle: const TextStyle(fontSize: 14),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/nextPage');
              },
              child: const Text("Let's get started"),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                ),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your phone number',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    hintText: 'Enter phone number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (!isValidPhoneNumber(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null; // Return null for no validation errors
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPPage()),
                      );
                    }
                  },
                  child: const Text('Get OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidPhoneNumber(String value) {
  // Define your phone number validation logic here
  // Return true if the phone number is valid, false otherwise
  final phoneRegex = r'^\d{10}$'; // Example: 10-digit phone number pattern
  final RegExp regex = RegExp(phoneRegex);
  return regex.hasMatch(value);
}

class OTPPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                ),
                child: const Icon(Icons.arrow_back),
              ),
              const Text(
                'Enter the OTP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTPBox(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a digit';
                      } else if (!isValidOTPDigit(value)) {
                        return 'Please enter a valid digit';
                      }
                      return null; // Return null for no validation errors
                    },
                  ),
                  OTPBox(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a digit';
                      } else if (!isValidOTPDigit(value)) {
                        return 'Please enter a valid digit';
                      }
                      return null; // Return null for no validation errors
                    },
                  ),
                  OTPBox(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a digit';
                      } else if (!isValidOTPDigit(value)) {
                        return 'Please enter a valid digit';
                      }
                      return null; // Return null for no validation errors
                    },
                  ),
                  OTPBox(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a digit';
                      } else if (!isValidOTPDigit(value)) {
                        return 'Please enter a valid digit';
                      }
                      return null; // Return null for no validation errors
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPBox extends StatelessWidget {
  final String? Function(String?)? validator;

  const OTPBox({
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}

bool isValidOTPDigit(String value) {
  // Define your OTP digit validation logic here
  // Return true if the digit is valid, false otherwise
  final digitRegex = r'^\d$'; // Example: Digit pattern
  final RegExp regex = RegExp(digitRegex);
  return regex.hasMatch(value);
}

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                ),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'First Name',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null; // Return null for no validation errors
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last Name',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null; // Return null for no validation errors
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date of birth',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null; // Return null for no validation errors
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email ID',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email ID';
                    } else if (!isValidEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null; // Return null for no validation errors
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bbar()),
                      );
                      // Perform registration logic here
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String value) {
  // Define your email validation logic here
  // Return true if the email address is valid, false otherwise
  final emailRegex =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  final RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(value);
}
