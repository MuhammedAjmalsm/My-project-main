import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/food_delivery_app/introhome1(03-1).dart';
import 'package:mynewapp/food_delivery_app/page123.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  




  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
   url: 'https://qioxnaizajmdpywwzecj.supabase.co',
   anonKey: 'sb_publishable_NLUptzUUs-nduTKf6L_kXQ_zwS6EgpW',
 );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  //LOGIN STATUS CHEKING 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key,required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter ScreenUtil Plus Example',

          // Use ResponsiveTheme to automatically scale all text styles
          home: isLoggedIn ? const mainhome() : loggin(),
        );
      },
      child:loggin(),
    );
  }
}
