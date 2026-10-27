import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 15, 15),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 15, 15),

        // leading: Icon(Icons.arrow_back, color: Colors.white),
        leading: IconButton(onPressed: (){Navigator.pop(context);
          
        }, icon:Icon(Icons.arrow_back)),
        title: Text(
          "Notification",
          style: GoogleFonts.urbanist(
            color: const Color.fromARGB(255, 242, 245, 242),
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(20),
          child: Icon(Icons.more_horiz_outlined, color: Colors.white),
        )],
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: const Color.fromARGB(255, 58, 55, 55)),
                      Column(
                        children: [
                          Text(
                            "    Order Cancelled!",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "19 Des, 2022 | 12:39 PM",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Container(
                          height: 15.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 38, 218, 74),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text("  New", style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "   You have canceled an order at Burger Hut. We apologize for your inconvenience. We will try to\n   improve our service next time",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 242, 245, 242),
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 68, 71, 67),
                      ),
                      Column(
                        children: [
                          Text(
                            "   Order Succusefull!",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "19 Des, 2022 | 12:30 PM",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Container(
                          height: 15.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 7, 255, 32),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text("  New", style: TextStyle(fontSize: 12)),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "You have placed an order at Burger Hut and paid ₹24. Your food will arrive soon. Enjoy our services",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 242, 245, 242),
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.stars_rounded)),
                      Column(
                        children: [
                          Text(
                            "   Servies Available!",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "14 Des, 2022 | 10:56 PM",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
            
                Text(
                  "You can now make multiple food orders at one time. you can also cancel orders",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 242, 245, 242),
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.account_balance_wallet)),
                      Column(
                        children: [
                          Text(
                            "  CreditCard Connected!",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "19 Des, 2022 | 12:30 PM",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Your credit card has been succesfully linked with food.Enjoy our servies",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 242, 245, 242),
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.person)),
                      Column(
                        children: [
                          Text(
                            "   Order Succusefull!",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "19 Des, 2022 | 12:30 PM",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 242, 245, 242),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Your account creation is succesful . you can now experianse our survices",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 242, 245, 242),
                    fontSize: 11.sp,
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
