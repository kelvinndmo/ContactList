import 'dart:io';

import 'package:flutter/foundation.dart';

class Contact {
  final File image;
  final String id;
  final String first_name;
  final String last_name;
  final String phone_number;

  Contact({
    @required this.image,
    @required this.id,
    @required this.first_name,
    @required this.last_name,
    @required this.phone_number,
  });
}
