import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadForm extends StatefulWidget {
  @override
  _ImageUploadFormState createState() => _ImageUploadFormState();
}

class _ImageUploadFormState extends State<ImageUploadForm> {
  File _image;

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Upload image from gallery"),
//      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context, _image);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListTile(
                  leading: Icon(
                Icons.arrow_back,
                color: Colors.blue,
                size: 50,
              )),
            ),
          ),
          Expanded(
            child: Center(
              child: _image == null
                  ? Icon(
                      Icons.photo_camera,
                      size: MediaQuery.of(context).size.height / 5,
                    )
                  : Image.file(
                      _image,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageFromGallery,
        child: Icon(Icons.camera),
      ),
    );
  }
}
