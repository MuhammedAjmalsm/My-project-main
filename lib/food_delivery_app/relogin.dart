import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/food_delivery_app/creatnewaccound.dart';
import 'package:mynewapp/food_delivery_app/forgetpassword.dart';
import 'package:mynewapp/food_delivery_app/introhome1(03-1).dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';



class relogin extends StatefulWidget {
  const relogin({super.key});

  @override
  State<relogin> createState() => _reloginState();
}

class _reloginState extends State<relogin> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var useremail = TextEditingController();
  var userpassword = TextEditingController();
  Future<void> _saveuserIdSharedPreferences(String useruid, param1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Useruid', useruid);
    await prefs.setBool('isLoggedIn', true);
  }

  //   Future<void> userlogin() async {
  //   try {
  //     if (!formKey.currentState!.validate()) return; {
  //       String email = emailController.text.trim();
  //       String password = passwordController.text.trim();

  //       var querysnapshot = await FirebaseFirestore.instance
  //           .collection('Customer')
  //           .where('Useremail', isEqualTo: email)
  //           .limit(1)
  //           .get();

  //       if (querysnapshot.docs.isNotEmpty) {
  //         var userData = querysnapshot.docs.first.data();
  //         if (userData['Userpassword'] == password) {
  //           await _saveuserIdSharedPreferences(
  //             userData['Useruid']??'',
  //             userData['Useremail']??'',
  //           );

  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print('faild $e');
  //   }
  // }
  //   Future<void> userlogin() async {
  //   try {
  //     if (!formKey.currentState!.validate()) return;

  //     String email = emailController.text.trim();
  //     String password = passwordController.text.trim();

  //     // ഫയർബേസിൽ ഇമെയിൽ തിരയുന്നു
  //     var querysnapshot = await FirebaseFirestore.instance
  //         .collection('Customer')
  //         .where('Useremail', isEqualTo: email)
  //         .limit(1)
  //         .get();

  //     if (querysnapshot.docs.isNotEmpty) {
  //       var userData = querysnapshot.docs.first.data();

  //       // 1. പാസ്‌വേഡ് ശരിയാണോ എന്ന് നോക്കുന്നു
  //       if (userData['Userpassword'] == password) {
  //         // SharedPreferences-ൽ സേവ് ചെയ്യുന്നു
  //         await _saveuserIdSharedPreferences(
  //           userData['Useruid'] ?? '',
  //           userData['Useremail'] ?? '',
  //         );
  // print(userData);
  //         if (mounted) {
  //           // 2. ലോഗിൻ ശരിയാണെങ്കിൽ മാത്രം അടുത്ത പേജിലേക്ക് പോകുന്നു
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => const mainhome()),
  //           );
  //         }
  //       } else {
  //         // പാസ്‌വേഡ് തെറ്റാണെങ്കിൽ മാത്രം
  //         _showMessage("Incorrect Password!");
  //       }
  //     } else {
  //       // ഇമെയിൽ കണ്ടില്ലെങ്കിൽ
  //       _showMessage("Email not registered!");
  //     }
  //   } catch (e) {
  //     print('Failed $e');
  //     _showMessage("Login failed: $e");
  //   }
  // }
  Future<void> userlogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      String email = emailController.text.trim();
      String password = passwordController.text;

      // Firebase Authentication Login
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        // Firestore-ൽ user details കണ്ടെത്തുന്നു
        var querysnapshot = await FirebaseFirestore.instance
            .collection('Customer')
            .where('Useruid', isEqualTo: user.uid)
            .limit(1)
            .get();

        if (querysnapshot.docs.isNotEmpty) {
          var userData = querysnapshot.docs.first.data();

          await _saveuserIdSharedPreferences(
            user.uid,
            userData['Useremail'] ?? '',
          );

          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const mainhome()),
          );
        } else {
          _showMessage("User details not found!");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
        _showMessage("Incorrect Email or Password!");
      } else if (e.code == 'user-not-found') {
        _showMessage("User not found!");
      } else if (e.code == 'invalid-email') {
        _showMessage("Invalid Email!");
      } else {
        _showMessage(e.message ?? "Login Failed!");
      }
    } catch (e) {
      _showMessage("Login Failed: $e");
    }
  }

  // മെസ്സേജ് കാണിക്കാനുള്ള ചെറിയ ഫംഗ്ഷൻ
  void _showMessage(String msg) {
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
    }
  }

  //     Future<void> signupuser() async {
  // if (!formKey.currentState!.validate()) {
  //   return;
  // }
  //     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 244, 243, 240),
          ),
        ),
      ),

      body: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(height: 70),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/unnamed.png',
                        width: 140,
                      ),
                    ),
                    Text(
                      "Login to Your Account",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter an email';
                          }
                          final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value.trim());

                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },

                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 23, 21, 21),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },

                        controller: passwordController,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 23, 21, 21),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text("Forget password"),
                    ),

                    // SizedBox(height: 15.h),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 140),
                    //   child: Row(
                    //     children: [
                    //       Checkbox(
                    //         value: false,
                    //         onChanged: (v) {},
                    //         activeColor: const Color.fromARGB(255, 47, 239, 54),
                    //       ),
                    //       const Text(
                    //         "Forget password",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            74,
                            253,
                            83,
                          ),
                          maximumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                        ),
                        onPressed: userlogin,
                        //    {if(formKey.currentState!.validate()){ userlogin();
                        // //  Navigator.push(

                        // //       context,
                        // //       MaterialPageRoute(builder: (context) =>mainhome ()),
                        // //     );
                        // //   }else{print("faild");}

                        //   },
                        child: Text("Login"),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 110,
                            endIndent: 10,
                            color: CupertinoColors.extraLightBackgroundGray,
                          ),
                        ),
                        Text(
                          "or continue with",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(child: Divider(endIndent: 110, indent: 10)),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color.fromARGB(111, 45, 57, 56),
                            ),
                            child: Icon(Icons.facebook, color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color.fromARGB(111, 45, 57, 56),
                            ),
                            child: Icon(
                              Icons.g_mobiledata,
                              color: const Color.fromARGB(255, 33, 243, 65),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color.fromARGB(111, 45, 57, 56),
                            ),
                            child: Icon(
                              Icons.apple,
                              color: const Color.fromARGB(255, 242, 245, 247),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don`t you have an account   ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signuppage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 55, 241, 4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  // ElevatedButton(onPressed: (){
                  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>signuppage()));
                  // }, child: Text("sign in"))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
