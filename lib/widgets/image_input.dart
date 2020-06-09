import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({
    Key key,
    @required this.onSelectImage,
  }) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  final picker = ImagePicker();

  Future<void> _takePicture() async {
    final imageFile =
        await picker.getImage(source: ImageSource.gallery, maxWidth: 600);
    var filePath = File(imageFile.path);
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(filePath.path);

    final savedImage =
        await File(filePath.path).copy('${appDir.path}/$filename');

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _storedImage != null
            ? ClipOval(
                child: Image.file(
                  _storedImage,
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                ),
              )
            : FlatButton.icon(
                icon: Icon(Icons.camera),
                color: Theme.of(context).primaryColor,
                label: Text("Upload Photo"),
                textColor: Colors.white,
                onPressed: _takePicture,
              )
      ],
    );
  }
}
