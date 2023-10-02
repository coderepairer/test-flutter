import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'package:telephony/telephony.dart';
import 'package:intl/intl.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String sms = "";
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('text_data');

    /*Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(allData);
    }
    getData();*/

    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.address); //+977981******67, sender nubmer
        print(message.body); //sms text
        var msgTimestamp =   message.date; //1659690242000, timestamp
        var date = DateTime.fromMillisecondsSinceEpoch(msgTimestamp!);


        var formattedDate = DateFormat('E, MMM d - hh:mm a').format(date); // Apr 8, 2020 10:02 AM
        print(formattedDate);


        //CollectionReference textData = FirebaseFirestore.instance.collection('text_Data');

          // Calling the collection to add new sms to cloud firestore
        //adding to firebase collection
        _collectionRef
              .add({
            //Data added in the form of a dictionary into the document.
            'sender': message.address,
            'recipient': message.serviceCenterAddress,
            'timestamp': formattedDate,
            'body': message.body,
            'fraud_threat' : true,
            'score' : 0.78
          })
              .then((value) => print("New SMS Added to text_data collection in firestore"))
              .catchError((error) => print("New SMS couldn't be added."));


        setState(() {
          sms = message.body.toString();
        });
      },
      listenInBackground: false,
    );
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'list',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
