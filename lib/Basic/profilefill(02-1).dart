// ignore: file_names
// ignore: file_namesimport 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynewapp/introhome1(03-1).dart';

// ignore: camel_case_types
class profilfill extends StatefulWidget {

  const profilfill({super.key});

  @override
  State<profilfill> createState() => _profilfillState();
}

// ignore: camel_case_types
class _profilfillState extends State<profilfill> {
    File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // you can use ImageSource.camera also
      imageQuality: 80,
    );

    if (pickedFile!= null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 234, 230, 230),
          elevation: 0,
          title: Text(
            "Fill Your Profile",
            style: TextStyle(color: const Color.fromARGB(233, 237, 232, 232)),
          ),
        ),

        body: ListView(
          children: [
            Column(
              children: [
                Center(
                      child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          backgroundImage: _selectedImage!= null? FileImage(_selectedImage!) : null,
          child: _selectedImage == null
             ? const Icon(Icons.person, size: 60, color: Colors.white)
              : null,
        ),
         
        // IconButton to pick image
       
    
  

                  
      //             child: Padding(
      //               padding: const EdgeInsets.only(bottom: 18),
      //               child: Stack(
      //                 children: [
      //                   CircleAvatar(


      //                     radius: 60.r,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(top: 90),
      //                     child: Container(
      //                       height: 35.h,
      //                       width: 35.w,
      //                       decoration: BoxDecoration(
      //                         color: CupertinoColors.activeGreen,
      //                         borderRadius: BorderRadius.circular(12.r),
      //                       ),
            
      //                       child: IconButton(
      //                         onPressed: () async {
      //                           ImagePicker picked = ImagePicker();
      //                           await picked.pickImage(
      //                             source: ImageSource.gallery,
      //                           );
      //                           setState(() {
                                  
      //                         image=File(pick!.path);
      //  });
      //     }, 

                              
      //                         icon: Icon(
      //                           Icons.edit,
      //                           color: const Color.fromARGB(255, 7, 12, 8),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
                ),
             IconButton(
          onPressed: _pickImage,
          icon: const Icon(Icons.camera_alt),
          iconSize: 30,
          color: Colors.blue,
          tooltip: 'Pick Image',
        ),
        const Text("Tap icon to pick image"),
      
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Full name",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 32, 37, 33),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nick name",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 32, 37, 33),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Date of Birth",
            
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 32, 37, 33),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => profilfill()),
                            );
                          },
                          icon: Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
            
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 32, 37, 33),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your name";
                        }
                        return null;
                      },
            
                      decoration: InputDecoration(
                        hintText: "+1 000 000 000",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 32, 37, 33),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: 450.w,
            
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Gender",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 32, 37, 33),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                SizedBox(
                  width: 450.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mainhome()),
                      );
                    },
                    
                    child: Text("Continue", style: TextStyle(fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
