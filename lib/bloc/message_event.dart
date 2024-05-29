part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}

class MessageRetrieveEvent extends MessageEvent {}
class MessageInsertEvent extends MessageEvent {
  final MessageModel message;

  MessageInsertEvent({required this.message});
}
class MessageUpdateEvent extends MessageEvent {
  final MessageModel message;

  MessageUpdateEvent({required this.message});
}
class MessageDeleteEvent extends MessageEvent {
  final MessageModel message;

  MessageDeleteEvent({required this.message});
}
