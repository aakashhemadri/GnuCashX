/// App
const String kAppTitle = 'GnuCashX';

/// Styles
///
const double kStyleMinLeadingWidth = 10;

/// GUID
///
const int kGUIDEncodingLength = 32;

/// Local Storage Keys
///
const String kLocalSettingsKey = 'settings';
const String kLocalSettingsPersistenceTypeKey = 'local';
const String kLocalGncKey = 'gnucash';

/// Settings
///
const String kSettingsFileName = 'gnucashx.config';

/// Testing
///
const String kSampleRawXMLFile = 'resources/sample.xml';
const String kSampleXMLFile = 'resources/sample.gnucash';
const String kSampleSQLiteFile = 'resources/sample.sqlite.gnucash';

/// Namespaces
///
/// Usage:
///
/// static const String prefix = kBook;
/// static String? namespace = kNamespace[kBook];
///
const String kNode = 'node';
const String kGnuCash = 'gnc';
const String kAccount = 'act';
const String kBook = 'book';
const String kCountData = 'cd';
const String kCommodity = 'cmdty';
const String kPrice = 'price';
const String kSlot = 'slot';
const String kSplit = 'split';
const String kScheduledTransaction = 'sx';
const String kTransaction = 'trn';
const String kBudget = 'bgt';

const kNamespace = {
  kNode: 'http://gnucashx.aakashhemadri.com/XML/node',
  kGnuCash: 'http://www.gnucash.org/XML/gnc',
  kAccount: 'http://www.gnucash.org/XML/act',
  kBook: 'http://www.gnucash.org/XML/book',
  kCountData: 'http://www.gnucash.org/XML/cd',
  kCommodity: 'http://www.gnucash.org/XML/cmdty',
  kPrice: 'http://www.gnucash.org/XML/price',
  kSlot: 'http://www.gnucash.org/XML/slot',
  kSplit: 'http://www.gnucash.org/XML/split',
  kScheduledTransaction: 'http://www.gnucash.org/XML/sx',
  kTransaction: 'http://www.gnucash.org/XML/trn',
  kBudget: 'http://www.gnucash.org/XML/bgt',
};
