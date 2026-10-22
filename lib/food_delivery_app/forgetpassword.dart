import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/food_delivery_app/relogin.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool _emailSent = false;

  Future<void> _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _emailSent = false;
    });

    try {
      final email = _emailController.text.trim();

      await _auth.sendPasswordResetEmail(
        email: email,
      );

      if (!mounted) return;

      setState(() {
        _emailSent = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'password reset link.',
          ),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'valid email.';
          break;

        case 'too-many-requests':
          errorMessage =
              'tray again.';
          break;

        case 'network-request-failed':
          errorMessage =
              'chek internet connection.';
          break;

        default:
          errorMessage =
              e.message ?? 'error.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Tray again.',
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/login.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),

              child: Container(
                width: 330.w,

                padding: EdgeInsets.all(20.w),

                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(25.r),
                ),

                child: Form(
                  key: _formKey,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Icon(
                        Icons.lock_reset,
                        size: 75.sp,
                        color: Colors.orange,
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        'forget password?',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 15.h),

                      Text(
                        'enter valid email. '
                        'password link.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white70,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      TextFormField(
                        controller: _emailController,

                        keyboardType:
                            TextInputType.emailAddress,

                        style: const TextStyle(
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'email',
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                          ),

                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),

                          filled: true,
                          fillColor:
                              Colors.white.withValues(alpha: 0.1),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12.r),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Colors.white54,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'enter email.';
                          }

                          if (!RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          ).hasMatch(value.trim())) {
                            return 'valid email.';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 25.h),

                      SizedBox(
                        width: double.infinity,
                        height: 50.h,

                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : _sendPasswordResetEmail,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12.r),
                            ),
                          ),

                          child: _isLoading
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'link send',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),

                      if (_emailSent) ...[
                        SizedBox(height: 20.h),

                        const Text(
                          'chek your email. '
                          //'ലിങ്ക് ലഭിച്ചാൽ അതിലൂടെ '
                          'password change.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ],

                      SizedBox(height: 20.h),

                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const relogin(),
                            ),
                            (route) => false,
                          );
                        },

                        child: const Text(
                          'go login page',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}