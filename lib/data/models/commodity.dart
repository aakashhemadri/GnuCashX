import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'commodity.freezed.dart';
part 'commodity.g.dart';

enum CommodityNamespace { currency, single, multi, unknown }
enum QuoteSource { currency }

@Freezed()
class Commodity extends Base with _$Commodity {
  const factory Commodity({
    required CommodityNamespace
        namespace, // Namespace like Curriences/Stocks/MutualFunds
    required String mnemonic, // Ticket Symbol/National Currencies ISO 4217
    required String fullname,
    required int fraction,
    required String cusip, // Special numbers like ISIN/CUSIP
    required bool quoteFlag,
    required QuoteSource quoteSource,
  }) = _Commodity;

  /// Creates commodity as currency
  /// TODO: Create a Locale Data type?
  factory Commodity.asCurrency({
    required String mnemonic,
    required String fullname,
    required int fraction,
    required String cusip,
  }) {
    return Commodity(
      namespace: CommodityNamespace.currency,
      mnemonic: mnemonic,
      fullname: fullname,
      fraction: fraction,
      cusip: cusip,
      quoteFlag: true,
      quoteSource: QuoteSource.currency,
    );
  }

  factory Commodity.fromJson(Map<String, dynamic> json) =>
      _$CommodityFromJson(json);
}
