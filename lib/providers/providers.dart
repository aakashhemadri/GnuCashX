library providers;

import 'package:flutter/material.dart';

import 'package:gnucashx/data/data.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' // Stub implementation
    if (dart.library.io) 'package:intl/intl_standalone.dart' // dart:io implementation
    if (dart.library.html) 'package:intl/intl_browser.dart'; // dart:html implementation

part 'ui_provider.dart';
part 'settings_provider.dart';
part 'account_provider.dart';
