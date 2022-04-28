import 'package:gnucashx/data/models/models.dart';

enum CommodityNamespace { currency, single, multi, unknown }
enum QuoteSource { currency }

class Commodity extends Node {
  /// Namespace like Curriences/Stocks/Mutual Funds
  final CommodityNamespace namespace;

  /// Ticket Symbol/National Currencies ISO 4217
  final String mnemonic;

  /// Full Name
  final String fullname;

  /// Fraction
  late int fraction;

  /// Special numbers like ISIN/CUSIP
  late String cusip;

  late bool quoteFlag;
  late QuoteSource quoteSource;

  /// Creates commodity as currency
  Commodity.isCurrency(
      {required this.namespace,
      required this.mnemonic,
      required this.fullname,
      required this.fraction,
      required this.cusip})
      : assert(namespace == CommodityNamespace.currency) {
    quoteFlag = true;
    quoteSource = QuoteSource.currency;
  }
}
