// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  final String id;
  final String message;
  final String description;
  MessageModel({
    required this.id,
    required this.message,
    required this.description,
  });

  MessageModel copyWith({
    String? id,
    String? message,
    String? description,
  }) {
    return MessageModel(
      id: id ?? this.id,
      message: message ?? this.message,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'description': description,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      message: map['message'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageModel(id: $id, message: $message, description: $description)';

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.message == message &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode ^ description.hashCode;
}
