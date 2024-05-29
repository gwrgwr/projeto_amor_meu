import 'package:aplicativo_maria/bloc/message_bloc.dart';
import 'package:aplicativo_maria/data/sqflite_data.dart';
import 'package:aplicativo_maria/models/message_model.dart';
import 'package:aplicativo_maria/themes/theme_change.dart';
import 'package:aplicativo_maria/views/message_insert.dart';
import 'package:aplicativo_maria/views/messaging_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyPageView extends StatefulWidget {
  MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final pageController = PageController();

  final bloc = MessageBloc(GetIt.instance.get<SqfliteData>());
  final List<MessageModel> list = [];
  @override
  void initState() {
    super.initState();
    bloc.add(MessageRetrieveEvent());
  }

  final controller = ThemeChange();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensageria'),
        actions: [
          IconButton(
            onPressed: () {
              controller.changeTheme();
            },
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          MessaginPage(bloc: bloc),
          MessageInsertPage(bloc: bloc, controller: pageController),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(pageController.page!.round() == 0) {

          pageController.jumpToPage(1);
          } else {
            pageController.jumpToPage(0);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
