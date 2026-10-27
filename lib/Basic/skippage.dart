import 'package:flutter/material.dart';

class skipp extends StatefulWidget {
  const skipp({super.key});

  @override
  State<skipp> createState() => _skippState();
}

class _skippState extends State<skipp> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _controller,
        children: [
          _buildPage(
            image: "assets/unnamed.png",
            title: "Order food",
            description: "anothor discription hear",
          ),
          _buildPage(
            image: "assets/unnamed.png",
            title: "Esay payment",
            description: "ddjahm",
          ),
        ],
      ),
    );
  }
}

Widget _buildPage({
  required String image,
  required String title,
  required String description,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(image, height: 300),
      SizedBox(height: 30),
      Text(title, style: TextStyle(color: Colors.green, fontSize: 30)),
      Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
