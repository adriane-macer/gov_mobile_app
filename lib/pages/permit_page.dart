import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gov/helpers/image_upload_form.dart';

class PermitPage extends StatefulWidget {
  @override
  _PermitPageState createState() => _PermitPageState();
}

class _PermitPageState extends State<PermitPage> {
  File _image1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permit page"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Barangay clearance",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  (_image1 == null)
                      ? InkWell(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageUploadForm(),
                              ),
                            );
                            if (result != null && result.runtimeType == File) {
                              setState(() {
                                _image1 = result;
                              });
                            }
                          },
                          child: ListTile(
                            leading: Icon(Icons.image),
                            title: Text("Add image from gallery"),
                          ),
                        )
                      : Image.file(
                          _image1,
                          fit: BoxFit.contain,
                        ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
