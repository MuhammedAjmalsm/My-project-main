import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/relogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


// ignore: camel_case_types
class signuppage extends StatefulWidget {
 
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}


class _signuppageState extends State<signuppage> {
    final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey =GlobalKey<FormState>();
 // final userSignupController = UserSignupCountroller();

   bool _ispasswordVisible = false;


  // Future<void> saveUserdata() async{
  //   final prefs = await SharedPreferences.getInstance();
  // debugPrint("Name controller = ${nameController.text}");
  //   await prefs.setString("name", nameController.text);
  //   await prefs.setString("mobile", numberController.text);
  //   await prefs.setString("email", emailController.text);
  //   await prefs.setString("password", passwordController.text);

  // }
 Future<void> signupuser() async {
  if (!formkey.currentState!.validate()) {
    return;
  }

  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    final user = userCredential.user;

    if (user == null) {
      print('User creation failed');
      return;
    }

    final useruid = user.uid;

    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(useruid)
        .set({
      'Username': nameController.text.trim(),
      'Useremail': emailController.text.trim(),
      'Usermobile': numberController.text.trim(),
      'Useruid': useruid,
      'createdAt': FieldValue.serverTimestamp(),
      'Userpassword':passwordController.text.trim(),
    });

    final pref = await SharedPreferences.getInstance();
    await pref.setString('useuid', useruid);
print(nameController);
    print('Signed up successfully!');
  } on FirebaseAuthException catch (e) {
    print('Firebase Auth error: ${e.code} - ${e.message}');
  } on FirebaseException catch (e) {
    print('Firebase error: ${e.code} - ${e.message}');
  } catch (e) {
    print('Failed to sign up: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(key: formkey,
        child: ListView(
          children: [
            SizedBox(height: 70,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/unnamed.png', width: 140),
                    ),
                    Text(
                      "Create New Account",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(style: TextStyle(color: Colors.white),
                
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full  Name",
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
                      child: TextFormField(style: TextStyle(color: Colors.white),
                       validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an email';
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
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
                      child: TextFormField(style: TextStyle(color: Colors.white),
                       validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an number';
                  }
                  final bool emailValid = RegExp(
                    r"^\+?([0-9]{1,4})[-\s]?([0-9]{1,15})$"
                  ).hasMatch(value.trim());
        
                  if (!emailValid) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
        
            
                        controller: numberController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          hintText: "Enter your Number",
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
                        


                        obscureText:! _ispasswordVisible,
                        style: TextStyle(color: Colors.white),
                        
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "password",
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              _ispasswordVisible = !_ispasswordVisible;
                            });
        
        
        
                          }, icon: Icon(_ispasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                          )),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 140),
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (v) {},
                            activeColor: const Color.fromARGB(255, 47, 239, 54),
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 320.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 74, 253, 83),
                          maximumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                        ),
                        onPressed: () 
                         {if(formkey.currentState!.validate()){ signupuser(); 
                       Navigator.push(
                            
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(builder: (context) =>relogin ()),
                          );
                        }else{print("faild");}
                        
                        },
                        child: Text("Sign up"),
                      ),
                    ),
                    SizedBox(height: 15.h),
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
                    ),  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account   ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context)=>relogin()));},
                          child: Text(
                            "Sign in ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 55, 241, 4),
                            ),
                          ),
                        ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Already have an account   ",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     Text(
                    //       "Sign in ",
                    //       style: TextStyle(
                    //         color: const Color.fromARGB(255, 55, 241, 4),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
          ]),
            ),)
          ],
        ),
      ),
    );
  }
}