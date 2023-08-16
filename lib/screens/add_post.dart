import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'bottom_bar.dart';

class Addpost extends StatefulWidget {
  final String category;

  const Addpost({Key? key, required this.category}) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  TextEditingController _brandController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _featureController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? _image;
  String imageUrl = '';
  bool _isImageLoading = false;

  Future<void> _selectImage() async {
    final ImagePicker _picker = ImagePicker();

    // Show dialog to choose between camera or gallery
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          actions: [
            TextButton(
              child: Text("Camera"),
              onPressed: () async {
                Navigator.pop(context);
                XFile? photo =
                    await _picker.pickImage(source: ImageSource.camera);
                _handleImageSelection(photo);
              },
            ),
            TextButton(
              child: Text("Gallery"),
              onPressed: () async {
                Navigator.pop(context);
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles(type: FileType.image);
                if (result != null && result.files.isNotEmpty) {
                  XFile? photo = XFile(result.files.first.path!);
                  _handleImageSelection(photo);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _handleImageSelection(XFile? photo) {
    if (photo != null) {
      File file = File(photo.path);

      setState(() {
        _image = file;
        print(_image);
      });
    }
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isImageLoading = true;
    });

    if (_image != null) {
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('productimages')
          .child(fileName);

      try {
        await ref.putFile(_image!);
        String downloadUrl = await ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
          _isImageLoading = false;
        });
      } catch (error) {
        // Handle error during image upload
        print('Error uploading image: $error');
        setState(() {
          _isImageLoading = false;
        });
      }
    }
  }

  // @override
  // void initState() {
  //   _brandController.addListener(() {
  //     print(_brandController.text);
  //   });
  //   super.initState();
  // }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'What are you renting?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      height: 1.21,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Rental details',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 1.6,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 24),
                          child: Text(
                            'Brand',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 56,
                          margin: const EdgeInsets.only(top: 15, left: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAECF0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _brandController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter the brand',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.83,
                                  letterSpacing: 0.1,
                                  color: Color(0xFF16161A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 24),
                          child: Text(
                            'Model',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 56,
                          margin: const EdgeInsets.only(top: 15, left: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAECF0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _modelController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter the Model',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.83,
                                  letterSpacing: 0.1,
                                  color: Color(0xFF16161A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            'Feature',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAECF0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _featureController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter the feature',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    height: 1.83,
                                    letterSpacing: 0.1,
                                    color: Color(0xFF16161A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 24),
                          child: Text(
                            'Location',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 56,
                          margin: const EdgeInsets.only(top: 15, left: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAECF0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _locationController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Select the location',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.83,
                                  letterSpacing: 0.1,
                                  color: Color(0xFF16161A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 24),
                          child: Text(
                            'Price',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 56,
                          margin: const EdgeInsets.only(top: 15, left: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAECF0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _priceController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter the Price in rupees',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.83,
                                  letterSpacing: 0.1,
                                  color: Color(0xFF16161A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 72,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAECF0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Description text',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    height: 1.83,
                                    letterSpacing: 0.1,
                                    color: Color(0xFF16161A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: _selectImage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/uploadbtn.svg',
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Upload images/videos',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _isImageLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Use the widget.category value here
                          print('Category: ${widget.category}');
                          print('Description: ${_descriptionController.text}');
                          print('imageurl: ${imageUrl}');

                          final uid = FirebaseAuth.instance.currentUser?.uid;

                          if (uid == null) {
                            return;
                          }
                          final user = await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(uid)
                              .get();

                          final username = user.data()?['first_name'];

                          if (_image != null) {
                            _uploadImage().then((_) async {
                              // Image upload completed
                              await FirebaseFirestore.instance
                                  .collection('products')
                                  .add({
                                'category': widget.category,
                                'brand': _brandController.text,
                                'model': _modelController.text,
                                'feature': _featureController.text,
                                'location': _locationController.text,
                                'price': _priceController.text,
                                'description': _descriptionController.text,
                                'imageUrl': imageUrl,
                                'userId': uid,
                              });

                              // Data saved successfully
                              print('Data saved successfully!');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottombar()),
                              );
                            }).catchError((error) {
                              // Error occurred while uploading image or saving data
                              print('Error: $error');
                            });
                          } else {
                            // Handle the case when no image is selected
                            print('Please select an image before posting.');
                          }
                        },
                        child: const Text(
                          'Post',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
