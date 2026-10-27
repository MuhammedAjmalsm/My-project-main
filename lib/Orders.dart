import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';


class orderstapbar extends StatefulWidget {
  const orderstapbar({super.key});

  @override
  State<orderstapbar> createState() => _orderstapbarState();
}

class _orderstapbarState extends State<orderstapbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    "Orders",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: const Color.fromARGB(255, 244, 243, 242),
                size: 30,
              ),
            ),
          ],
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            labelColor: const Color.fromARGB(255, 81, 255, 7),
            indicatorColor: const Color.fromARGB(255, 81, 255, 7),

            //dividerHeight: 48,
            tabs: [
              Tab(text: "   Active   "),
              Tab(text: "Completed"),
              Tab(text: "cancelled"),
            ],
          ),
        ),
        body: TabBarView(children: [Active(), completed(), cancelled()]),

        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Color(0xFF1F222A),
        //   type: BottomNavigationBarType.fixed,
        //   selectedLabelStyle: TextStyle(color: Colors.grey),
        //   unselectedLabelStyle: TextStyle(color: Colors.amber),

        //   selectedItemColor: Colors.green,
        //   unselectedIconTheme: IconThemeData(
        //     color: const Color.fromARGB(255, 182, 179, 170),
        //   ),

        //   items: [
        //     BottomNavigationBarItem(
        //       icon: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => mainhome()),
        //           );
        //         },
        //         icon: const Icon(Icons.home),
        //       ),
        //       label: "Home",
        //     ),

        //     BottomNavigationBarItem(
        //       icon: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => orderstapbar()),
        //           );
        //         },
        //         icon: const Icon(Icons.document_scanner),
        //       ),
        //       label: "Orders",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => message()),
        //           );
        //         },
        //         icon: const Icon(Icons.message),
        //       ),
        //       label: "Message",
        //     ),
        //     const BottomNavigationBarItem(
        //       icon: Icon(Icons.account_balance_wallet_rounded),
        //       label: "E-Wallet",
        //     ),
        //     const BottomNavigationBarItem(
        //       icon: Icon(Icons.person_outline),
        //       label: "Profie",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class Active extends StatefulWidget {
  const Active({super.key});

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 16, 16),
      body: Center(
        child: Column(
          children: [
            Text(
              "Empty",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 15.sp,
              ),
            ),
            Text(
              "You dont have any food in cart at this time",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class completed extends StatefulWidget {
  const completed({super.key});

  @override
  State<completed> createState() => _completedState();
}

// ignore: camel_case_types
class _completedState extends State<completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 16, 16),
      body: Center(
        child: Column(
          children: [
            Text(
              "Empty",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 15.sp,
              ),
            ),
            Text(
              "You dont have any food in cart at this time",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cancelled extends StatefulWidget {
  const cancelled({super.key});

  @override
  State<cancelled> createState() => _cancelledState();
}

class _cancelledState extends State<cancelled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 16, 16),
      body: Center(
        child: Column(
          children: [
            Text(
              "Empty",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 15.sp,
              ),
            ),
            Text(
              "You dont have any food in cart at this time",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
