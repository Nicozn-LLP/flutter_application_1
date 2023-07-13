import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/otp_screen.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:lottie/lottie.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isValidPhoneNumber = false;

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  void validatePhoneNumber() {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    setState(() {
      isValidPhoneNumber = phoneRegex.hasMatch(phoneNumber.text);
    });
  }

  void sendOTP() {
    // Simulate OTP sending
    // Replace this with your actual OTP sending logic or API call
    print('OTP sent to: ${countrycode.text + phoneNumber.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_zl2c0cuv.json',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Phone Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We need to register your phone before getting started!',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                        onChanged: (value) {
                          validatePhoneNumber();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isValidPhoneNumber
                      ? () {
                          sendOTP();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyOtp()),
                          );
                        }
                      : null, // Disable the button if phone number is invalid
                  child: Text('Send the code'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
