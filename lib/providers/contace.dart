import 'dart:io';

import 'package:contactlist/models/contact.dart';
import 'package:flutter/material.dart';

class Contacts with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts {
    return [..._contacts];
  }

  addContact(Contact contact) {
    this._contacts.add(contact);
    notifyListeners();
  }
}
