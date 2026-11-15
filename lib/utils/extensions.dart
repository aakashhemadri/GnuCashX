import 'package:flutter/material.dart';
import 'package:gnucashx/l10n/gnc_localizations.dart';

extension LocalizationExtension on BuildContext {
  /// Convenient accessor for localized strings
  G get l10n => G.of(this)!;
}
