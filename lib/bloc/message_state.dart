part of 'message_bloc.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageLoading extends MessageState {}

final class MessageSuccess extends MessageState {
  final List<MessageModel> messageList;

  MessageSuccess({required this.messageList});
}

final class MessageError extends MessageState {
  final String errorMessage;

  MessageError({required this.errorMessage});
}
