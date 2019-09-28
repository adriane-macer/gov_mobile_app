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
  File _image2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permit page"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              print(result);
                              if (result != null ) {
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilder(
                          child: FormBuilderTextField(
                        attribute: "First name",
                        decoration: InputDecoration(labelText: "Description"),
//                onChanged: (_){},
                        validators: [],
                      )),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Building permit",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    (_image2 == null)
                        ? InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageUploadForm(),
                          ),
                        );
                        print(result);
                        if (result != null ) {
                          setState(() {
                            _image2 = result;
                          });
                        }
                      },
                      child: ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Add image from gallery"),
                      ),
                    )
                        : Image.file(
                      _image2,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilder(
                          child: FormBuilderTextField(
                            attribute: "First name",
                            decoration: InputDecoration(labelText: "Description"),
//                onChanged: (_){},
                            validators: [],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
