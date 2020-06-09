import 'dart:io';

import 'package:contactlist/models/contact.dart';
import 'package:contactlist/providers/contace.dart';
import 'package:contactlist/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  static const id = "add_contact";
  const AddContact({
    Key key,
  }) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _phoneNumberController = new TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveContact() {
    if (_pickedImage == null ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty) {
      return;
    }

    Contact contact = Contact(
        id: DateTime.now().toString(),
        first_name: _firstNameController.text,
        last_name: _lastNameController.text,
        phone_number: _phoneNumberController.text,
        image: _pickedImage);
    print(contact);
    Provider.of<Contacts>(context, listen: false).addContact(contact);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageInput(
              onSelectImage: _selectImage,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter First Name'),
              controller: _firstNameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Last Name'),
              controller: _lastNameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter phone number'),
              controller: _phoneNumberController,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton.icon(
                color: Theme.of(context).accentColor,
                onPressed: _saveContact,
                icon: Icon(Icons.person_add),
                textColor: Colors.white,
                label: Text("Add Person"))
          ],
        ),
      ),
    );
  }
}
