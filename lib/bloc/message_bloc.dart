import 'package:aplicativo_maria/data/sqflite_data.dart';
import 'package:aplicativo_maria/models/message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final SqfliteData sqfliteData;
  MessageBloc(this.sqfliteData) : super(MessageInitial()) {
    on<MessageRetrieveEvent>((event, emit) async {
      emit(MessageSuccess(messageList: await sqfliteData.retrieveAll()));
    });

    on<MessageInsertEvent>((event, emit) async {
      await sqfliteData.insertData(event.message);
      add(MessageRetrieveEvent());
    });

    on<MessageUpdateEvent>((event, emit) async {
      await sqfliteData.updateData(event.message);
      add(MessageRetrieveEvent());
    });

    on<MessageDeleteEvent>((event, emit) async {
      await sqfliteData.deleteTuple(event.message.id);
    });
  }
}
