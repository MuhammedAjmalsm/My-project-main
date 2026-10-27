import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagepickar extends StatefulWidget {
  const imagepickar({super.key});

  @override
  State<imagepickar> createState() => _imagepickarState();
}

class _imagepickarState extends State<imagepickar> {
  XFile? pick;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  ImagePicker picked = ImagePicker();
                  pick = await picked.pickImage(source: ImageSource.gallery);
                  setState(() {
                    image = File(pick!.path);
                  });
                },
                child: Text('pick'),
              ),
              image == null ? Text('no image') : Image.file(image!),
            ],
          ),
        ),
      ),
    );
    //        ],
    //      ),
    //    ),
    // );
  }
}
