import 'package:aplicativo_maria/bloc/message_bloc.dart';
import 'package:aplicativo_maria/data/sqflite_data.dart';
import 'package:aplicativo_maria/injections/get_injections.dart';
import 'package:aplicativo_maria/themes/theme.dart';
import 'package:aplicativo_maria/views/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
  setup();
  SqfliteData().deleteAllFromTable();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageBloc(GetIt.instance.get<SqfliteData>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: const MaterialTheme(TextTheme()).dark(),
        home: MyPageView(),
      ),
    );
  }
}
