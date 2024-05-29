import 'package:aplicativo_maria/bloc/message_bloc.dart';
import 'package:aplicativo_maria/components/my_snackbar.dart';
import 'package:aplicativo_maria/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class MessageInsertPage extends StatelessWidget {
  MessageInsertPage({required this.bloc, required this.controller, super.key});

  final MessageBloc bloc;
  final PageController controller;

  TextEditingController messageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Inserir novas mensagens',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: 35),
          Text(
            'Título da mensagem',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            controller: messageController,
            decoration: InputDecoration(
              hintText: "Mensagem",
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Descrição da mensagem',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            maxLines: null,
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: "Descrição",
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () async {
                if (messageController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    MySnackBar().mySnackBar(
                      'Escreva alguma coisa nos campos!',
                      context,
                    ),
                  );
                } else {
                  bloc.add(
                    MessageInsertEvent(
                      message: MessageModel(
                          id: Uuid().v1(),
                          message: messageController.text,
                          description: descriptionController.text),
                    ),
                  );
                  await controller.animateToPage(
                    0,
                    duration: const Duration(seconds: 3),
                    curve: Curves.ease,
                  );
                  messageController.clear();
                  descriptionController.clear();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
