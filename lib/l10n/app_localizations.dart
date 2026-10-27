import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ne.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'NEC CSE License Prep'**
  String get appTitle;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Study Notes'**
  String get notes;

  /// No description provided for @practice.
  ///
  /// In en, this message translates to:
  /// **'Practice Quiz'**
  String get practice;

  /// No description provided for @mockExam.
  ///
  /// In en, this message translates to:
  /// **'Exam Simulator'**
  String get mockExam;

  /// No description provided for @pyq.
  ///
  /// In en, this message translates to:
  /// **'Past Papers (PYQ)'**
  String get pyq;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @readinessScore.
  ///
  /// In en, this message translates to:
  /// **'Exam Readiness'**
  String get readinessScore;

  /// No description provided for @startExam.
  ///
  /// In en, this message translates to:
  /// **'Start Exam'**
  String get startExam;

  /// No description provided for @continueStudying.
  ///
  /// In en, this message translates to:
  /// **'Continue Studying'**
  String get continueStudying;

  /// No description provided for @recommendedAction.
  ///
  /// In en, this message translates to:
  /// **'Recommended Next Step'**
  String get recommendedAction;

  /// No description provided for @weakAreas.
  ///
  /// In en, this message translates to:
  /// **'Focus & Weak Areas'**
  String get weakAreas;

  /// No description provided for @passMarkInfo.
  ///
  /// In en, this message translates to:
  /// **'Pass Mark: 50% (25 / 50)'**
  String get passMarkInfo;

  /// No description provided for @timeRemaining.
  ///
  /// In en, this message translates to:
  /// **'Time Remaining'**
  String get timeRemaining;

  /// No description provided for @submitExam.
  ///
  /// In en, this message translates to:
  /// **'Submit Exam'**
  String get submitExam;

  /// No description provided for @examPassed.
  ///
  /// In en, this message translates to:
  /// **'Passed! Ready for NEC License'**
  String get examPassed;

  /// No description provided for @examFailed.
  ///
  /// In en, this message translates to:
  /// **'Keep Practicing (Under 50%)'**
  String get examFailed;

  /// No description provided for @reviewAnswers.
  ///
  /// In en, this message translates to:
  /// **'Review All Answers'**
  String get reviewAnswers;

  /// No description provided for @resetQuestionPool.
  ///
  /// In en, this message translates to:
  /// **'Reset Question Pool'**
  String get resetQuestionPool;

  /// No description provided for @guestMode.
  ///
  /// In en, this message translates to:
  /// **'Guest Mode (Local Only)'**
  String get guestMode;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In to Sync'**
  String get signIn;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @searchNotes.
  ///
  /// In en, this message translates to:
  /// **'Search notes, topics...'**
  String get searchNotes;

  /// No description provided for @markAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get markAsCompleted;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// No description provided for @explanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanation;

  /// No description provided for @flagQuestion.
  ///
  /// In en, this message translates to:
  /// **'Flag for Review'**
  String get flagQuestion;

  /// No description provided for @unflagQuestion.
  ///
  /// In en, this message translates to:
  /// **'Remove Flag'**
  String get unflagQuestion;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @allChapters.
  ///
  /// In en, this message translates to:
  /// **'All 10 Syllabus Chapters'**
  String get allChapters;

  /// No description provided for @filterByUnit.
  ///
  /// In en, this message translates to:
  /// **'Filter by Chapter / Unit'**
  String get filterByUnit;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ne':
      return AppLocalizationsNe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
