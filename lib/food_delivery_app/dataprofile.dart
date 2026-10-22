// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class dataprofile extends StatefulWidget {
//   const dataprofile({super.key});

//   @override
//   State<dataprofile> createState() => _dataprofileState();
// }

// class _dataprofileState extends State<dataprofile> {
// //FIRE BASILE DATA EDUKKUNNATHE (1)
//   String username = '';
//   String useremail = '';
//   String usermobaile = '';
//   String userpassword = '';
//   // ignore: prefer_typing_uninitialized_variables
//   var user;
//   // String name = "";
//   // String mobile = "";
//   // String email = "";
//   bool isDarkMode = true; // Dark mode switch state

//   // Future<void> loadUserData() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   final savedName = prefs.getString("name");

//   //   print("Saved name = $savedName");
//   //   setState(() {
//   //     name = prefs.getString("name") ?? "";
//   //     mobile = prefs.getString("mobile") ?? "";
//   //     email = prefs.getString("email") ?? "";
//   //   });
//   // }

//   File? _selectedImage;
//   final SupabaseClient _supabase = Supabase.instance.client;
//   final ImagePicker _picker = ImagePicker();

//   String? _imageUrl;
//   bool _isLoading = false;

//   Future<void> _pickImage() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );

//   //   if (pickedFile != null) return;{
//   //     setState(() {
//   //       _isLoading = true;

//   //       _selectedImage = File(pickedFile.path);
//   //     });
//   //      {
//   //     final bytes = await pickedFile.readAsBytes();
//   //     final String fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';

//   //     await _supabase.storage.from('avatars').uploadBinary(
//   //           fileName,
//   //           bytes,
//   //           fileOptions: const FileOptions(contentType: 'image/jpeg'),
//   //         );
//   //         final String publicUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);
          
//   //   }}
//   // }
//   if (pickedFile == null) return;

//     setState(() {
//       _isLoading = true;
//     });

     
//       final bytes = await pickedFile.readAsBytes();
//       final String fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';

//       await _supabase.storage.from('avatars').uploadBinary(
//             fileName,
//             bytes,
//             fileOptions: const FileOptions(contentType: 'image/jpeg'),
//           );
//           final String publicUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);

//           final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('saved_image_url', publicUrl);
      
  

  
  
  

//  // final FirebaseAuth _auth = FirebaseAuth.instance;
//  Future<void> fetchUserDetails() async {
//   try {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? userId = pref.getString('Useruid');
//     print("Fetched User ID: $userId");

//     if (userId != null && userId.isNotEmpty) {
//       DocumentSnapshot usersnapshot = await FirebaseFirestore.instance
//           .collection('Customer')
//           .doc(userId)
//           .get();

//       if (usersnapshot.exists) {
//         var data = usersnapshot.data() as Map<String, dynamic>;
//         print("User Data : $data");

//         setState(() {
//           user = data;
//           username = data['Username'] ?? "";
//           usermobaile = data['Usermobile'] ?? "";
//           userpassword = data['Userpassword'] ?? "";
//         });
//       }
//     }
//   } catch (e) {
//     print("Error fetching user details: $e");
//   }
// }






//   @override
//   void initState() {
//     super.initState();
//     fetchUserDetails();
//     _loadSavedImageUrl();
//   }

  



//   Future<void> _loadSavedImageUrl() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedUrl = prefs.getString('saved_image_url');
//     if (!mounted) return;
//     setState(() {
//       _imageUrl = savedUrl;
//     });
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,

//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: Padding(
//           padding: const EdgeInsets.all(5),
//           child: SizedBox(
//             child: Image.asset('assets/images/unnamed.png', width: 150),
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Profile",
//                   style: TextStyle(color: Colors.white, fontSize: 18.sp),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Icon(
//               Icons.more_horiz,
//               color: const Color.fromARGB(255, 244, 243, 242),
//               size: 30,
//             ),
//           ),
//         ],
//       ),

//       body: ListView(
//         children: [
//           Column(
//             children: [
//               SizedBox(height: 12),
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: const Color.fromARGB(255, 241, 242, 244),
//                   radius: 30.r,
//                   backgroundImage: _selectedImage != null
//                       ? FileImage(_selectedImage!)
//                       : null,
//                 ),
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       username,
//                  style: TextStyle(color: const Color.fromARGB(255, 245, 243, 243), fontSize: 17),

//                     ),
//                     Text(
//                       usermobaile,
//                       style: TextStyle(color: const Color.fromARGB(255, 245, 243, 243), fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 trailing: IconButton(
//                   onPressed: _pickImage,
//                   icon: Icon(
//                     Icons.edit,
//                     color: const Color.fromARGB(255, 52, 249, 17),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 10),
//               Divider(color: Colors.grey.shade800, thickness: 0.5),

//               // --- OPTIONS LIST ---

//               // My Favorite Restaurants
//               ListTile(
//                 leading: Icon(Icons.storefront_outlined, color: Colors.white),
//                 title: Text("My Favorite Restaurants", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Special Offers & Promo
//               ListTile(
//                 leading: Icon(Icons.local_offer_outlined, color: Colors.white),
//                 title: Text("Special Offers & Promo", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Payment Methods
//               ListTile(
//                 leading: Icon(Icons.payment, color: Colors.white),
//                 title: Text("Payment Methods", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               Divider(color: Colors.grey.shade800, thickness: 0.5),

//               // Profile
//               ListTile(
//                 leading: Icon(Icons.person_outline, color: Colors.white),
//                 title: Text("Profile", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Address
//               ListTile(
//                 leading: Icon(Icons.location_on_outlined, color: Colors.white),
//                 title: Text("Address", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Notification
//               ListTile(
//                 leading: Icon(Icons.notifications_none, color: Colors.white),
//                 title: Text("Notification", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Security
//               ListTile(
//                 leading: Icon(Icons.security, color: Colors.white),
//                 title: Text("Security", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Language
//               ListTile(
//                 leading: Icon(Icons.language, color: Colors.white),
//                 title: Text("Language", style: TextStyle(color: Colors.white)),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("English (US)", style: TextStyle(color: Colors.white70, fontSize: 14)),
//                     SizedBox(width: 5),
//                     Icon(Icons.chevron_right, color: Colors.white),
//                   ],
//                 ),
//                 onTap: () {},
//               ),

//               // Dark Mode Switch
//               ListTile(
//                 leading: Icon(Icons.remove_red_eye_outlined, color: Colors.white),
//                 title: Text("Dark Mode", style: TextStyle(color: Colors.white)),
//                 trailing: Switch(
//                   value: isDarkMode,
//                   activeThumbColor: Colors.green,
//                   onChanged: (value) {
//                     setState(() {
//                       isDarkMode = value;
//                     });
//                   },
//                 ),
//               ),

//               // Help Center
//               ListTile(
//                 leading: Icon(Icons.info_outline, color: Colors.white),
//                 title: Text("Help Center", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Invite Friends
//               ListTile(
//                 leading: Icon(Icons.people_outline, color: Colors.white),
//                 title: Text("Invite Friends", style: TextStyle(color: Colors.white)),
//                 trailing: Icon(Icons.chevron_right, color: Colors.white),
//                 onTap: () {},
//               ),

//               // Logout
//               ListTile(
//                 leading: Icon(Icons.logout, color: Colors.redAccent),
//                 title: Text("Logout", style: TextStyle(color: Colors.redAccent)),
//                 onTap: () {
//                   // Logout functionality add cheyyam
//                 },
//               ),

//               SizedBox(height: 20),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class dataprofile extends StatefulWidget {
  const dataprofile({super.key});

  @override
  State<dataprofile> createState() => _dataprofileState();
}

class _dataprofileState extends State<dataprofile> {
  // FIREBASE DATA
  String username = '';
  String useremail = '';
  String usermobaile = '';
  String userpassword = '';
  var user;
  bool isDarkMode = true;



  

  // SUPABASE & IMAGE PICKER
  final SupabaseClient _supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  String? _imageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    _loadSavedImageUrl();
  }

  // 1. SharedPreferences-ൽ നിന്ന് Saved URL ലോഡ് ചെയ്യുന്നു
  // Future<void> _loadSavedImageUrl() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedUrl = prefs.getString('saved_image_url');
  //   if (!mounted) return;
  //   setState(() {
  //     _imageUrl = savedUrl;
  //   });
  // }

  // // 2. Image Select ചെയ്ത് Supabase-ലേക്ക് Upload ചെയ്യുന്ന ഫങ്ഷൻ
  // Future<void> _pickImage() async {
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 80,
  //   );

  //   if (pickedFile == null) return;

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     final bytes = await pickedFile.readAsBytes();
  //     final String fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';

  //     // Supabase storage-ലേക്ക് Binary അപ്‌ലോഡ്
  //     await _supabase.storage.from('avatars').uploadBinary(
  //           fileName,
  //           bytes,
  //           fileOptions: const FileOptions(contentType: 'image/jpeg'),
  //         );

  //     // Public URL എടുക്കുന്നു
  //     final String publicUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);

  //     // SharedPreferences-ൽ URL സൂക്ഷിക്കുന്നു
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('saved_image_url', publicUrl);

  //     if (!mounted) return;
  //     setState(() {
  //       _imageUrl = publicUrl;
  //     });
  //   } catch (e) {
  //     print("Upload Error: $e");
  //     if (!mounted) return;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Upload failed: $e')),
  //     );
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }
  TextEditingController namecontroller = TextEditingController();
   TextEditingController mobilecontroller = TextEditingController();
  // late String profilfieIdforupdate




  Future<void> _pickImage() async {
  // SharedPreferences-ൽ നിന്ന് ലോഗിൻ ചെയ്ത യൂസറുടെ ID എടുക്കുന്നു
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? userId = pref.getString('Useruid');

  if (userId == null || userId.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User ID കണ്ടുപിടിക്കാൻ പറ്റിയില്ല!')),
    );
    return;
  }

  final XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 60,
  );

  if (pickedFile == null) return;

  setState(() {
    _isLoading = true;
  });

  try {
    final bytes = await pickedFile.readAsBytes();
    
    // 1. ഓരോ യൂസറിനും സ്വന്തം Folder Path നൽകുന്നു
    final String filePath = '$userId/profile.jpg';

    // 2. Overwrite (upsert: true) ഓപ്ഷൻ നൽകി അപ്‌ലോഡ് ചെയ്യുന്നു
    await _supabase.storage.from('avatars').uploadBinary(
          filePath,
          bytes,
          fileOptions: const FileOptions(
            contentType: 'image/jpeg',
            upsert: true,
          ),
        );

    // 3. Cache പ്രശ്നം ഒഴിവാക്കാൻ Timestamp ചേർത്ത് Public URL ഉണ്ടാക്കുന്നു
    final String publicUrl = '${_supabase.storage.from('avatars').getPublicUrl(filePath)}?t=${DateTime.now().millisecondsSinceEpoch}';

    // 4. SharedPreferences-ൽ സൂക്ഷിക്കുന്നു
    await pref.setString('saved_image_url', publicUrl);

    if (!mounted) return;
    setState(() {
      _imageUrl = publicUrl;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('പ്രൊഫൈൽ ചിത്രം മാറ്റിയു!')),
    );
  } catch (e) {
    print("Upload Error: $e");
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Upload failed: $e')),
    );
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

  // 3. Firebase വിവരങ്ങൾ എടുക്കുന്നു
  Future<void> fetchUserDetails() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('Useruid');
      print("Fetched User ID: $userId");

      if (userId != null && userId.isNotEmpty) {
        DocumentSnapshot usersnapshot = await FirebaseFirestore.instance
            .collection('Customer')
            .doc(userId)
            .get();

        if (usersnapshot.exists) {
          var data = usersnapshot.data() as Map<String, dynamic>;
          print("User Data : $data");

          setState(() {
            user = data;
            username = data['Username'] ?? "";
            usermobaile = data['Usermobile'] ?? "";
            userpassword = data['Userpassword'] ?? "";
          });
        }
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            child: Image.asset('assets/images/unnamed.png', width: 150),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.more_horiz,
              color: Color.fromARGB(255, 244, 243, 242),
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 12),
              ListTile(
                // Dynamic Profile Image Display
                leading: InkWell(onTap: () {
                  _pickImage();
                },
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 241, 242, 244),
                    radius: 30.r,
                    child: _isLoading
                        ? const CircularProgressIndicator(strokeWidth: 2)
                        : ClipOval(
                            child: _imageUrl != null
                                ? Image.network(
                                    _imageUrl!,
                                    width: 60.r,
                                    height: 60.r,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.broken_image, color: Colors.grey),
                                  )
                                : const Icon(Icons.person, size: 35, color: Colors.grey),
                          ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 245, 243, 243),
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      usermobaile,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 245, 243, 243),
                        fontSize: 12,
                      ),
                    ),
                  ],
                 ),
                 trailing:
                 IconButton(
            onPressed: () {
              
              namecontroller.text = username;
              mobilecontroller.text = usermobaile;
            
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(color:Colors.amber),
                    ),
                    content: SizedBox(
                      height: 300.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(fontSize: 20)),
                          ),
                          TextField(
                            controller: mobilecontroller,
                            decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(fontSize: 20)),
                          ),
                          
                    
                      TextButton(onPressed: () async {
  if (namecontroller.text.trim().isEmpty ||
      mobilecontroller.text.trim().isEmpty) {
    ScaffoldMessenger.of(this.context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all fields"),
      ),
    );
    return;
  }

  try {
    SharedPreferences pref =
        await SharedPreferences.getInstance();

    String? userId = pref.getString('Useruid');

    if (userId == null || userId.isEmpty) {
      throw Exception("User ID not found");
    }

    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(userId)
        .update({
      'Username': namecontroller.text.trim(),
      'Usermobile': mobilecontroller.text.trim(),
    });

    if (!mounted) return;

    setState(() {
      username = namecontroller.text.trim();
      usermobaile = mobilecontroller.text.trim();
    });

    // Dialog close ചെയ്യുന്നു
    Navigator.of(context).pop();

    ScaffoldMessenger.of(this.context).showSnackBar(
      const SnackBar(
        content: Text("Profile Updated Successfully"),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    debugPrint("Firebase Update Error: $e");

    if (!mounted) return;

    ScaffoldMessenger.of(this.context).showSnackBar(
      SnackBar(
        content: Text("Update Failed: $e"),
        backgroundColor: Colors.red,
      ),
    );
  }
},
child: const Text('Update'),
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: Text('Cancel'),
                      // ),
                      // TextButton(
                      //   onPressed: () async {
                      //     if (namecontroller.text.isNotEmpty &&
                      //         mobilecontroller.text.isNotEmpty 
                      //         ) {
                      //       SharedPreferences pref =
                      //           await SharedPreferences.getInstance();
                      //       String? userId = pref.getString('Useruid');
                      //       if (userId != null) {
                      //         FirebaseFirestore.instance
                      //             .collection('Customer')
                      //             .doc(userId)
                      //             .update({
                      //           'Username': namecontroller.text,
                      //           'Usermobile': mobilecontroller.text,
                               
                      //         }).then((value) {
                      //           setState(() {
                      //             username = namecontroller.text;
                      //             usermobaile = mobilecontroller.text;
                                
                      //           });
                      //           Navigator.of(context).pop();
                      //         });
                      //       }
                      //     }
                      //   },
                      //   child: Text('Update'),
                      ),
                    ],),
                  ));
                },
              );
            },
            icon: Icon(Icons.edit),
            
          ))
        
                 
                

                        
                         
                         
                         
                         



                          



                          
                         
                    
                  
                  
                
                    

               ,SizedBox(height: 10),
              Divider(color: Colors.grey.shade800, thickness: 0.5),

              // --- OPTIONS LIST ---
              ListTile(
                leading: const Icon(Icons.storefront_outlined, color: Colors.white),
                title: const Text("My Favorite Restaurants", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.local_offer_outlined, color: Colors.white),
                title: const Text("Special Offers & Promo", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.white),
                title: const Text("Payment Methods", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),

              Divider(color: Colors.grey.shade800, thickness: 0.5),

              ListTile(
                leading: const Icon(Icons.person_outline, color: Colors.white),
                title: const Text("Profile", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined, color: Colors.white),
                title: const Text("Address", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications_none, color: Colors.white),
                title: const Text("Notification", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.security, color: Colors.white),
                title: const Text("Security", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.white),
                title: const Text("Language", style: TextStyle(color: Colors.white)),
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("English (US)", style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(width: 5),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                title: const Text("Dark Mode", style: TextStyle(color: Colors.white)),
                trailing: Switch(
                  value: isDarkMode,
                  activeThumbColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.white),
                title: const Text("Help Center", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.people_outline, color: Colors.white),
                title: const Text("Invite Friends", style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text("Logout", style: TextStyle(color: Colors.redAccent)),
                onTap: () {},
              ),
               SizedBox(height: 20),]
          )
            ],
          ),
        
      );
    
  }

  void _loadSavedImageUrl() {}
}