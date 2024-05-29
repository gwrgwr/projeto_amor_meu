import 'dart:math';

import 'package:aplicativo_maria/animations/heart_animation.dart';
import 'package:aplicativo_maria/bloc/message_bloc.dart';
import 'package:aplicativo_maria/components/my_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessaginPage extends StatelessWidget {
  const MessaginPage({required this.bloc, super.key});

  final MessageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Qual será a mensagem de hoje?',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 25),
          BlocBuilder<MessageBloc, MessageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is MessageError) {
                Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is MessageLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MessageSuccess) {
                if (state.messageList.isEmpty) {}
                return TextButton(
                  onPressed: () {
                    if (state.messageList.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        MySnackBar().mySnackBar(
                          "Precisa adicionar uma mensagem!",
                          context,
                        ),
                      );
                    } else {
                      final item = state.messageList[Random().nextInt(
                        state.messageList.length,
                      )];
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  width: 400,
                                  height: 600,
                                  child: Column(
                                    children: [
                                      Text(
                                        // 'Seja bem vinda!',
                                        item.message,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        // 'Criei esse aplicativo com o final de te passar mensagens bonitas no seu dia a dia e nunca se esquecer do amor que eu tenho por você. Ele não está completo ainda, mas ainda vou completá-lo, para que você possa usufruir totalmente do mesmo.',
                                        item.description,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                            child: Text(
                                              'Fechar',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              HeartAnimation(),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Receber amor',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
