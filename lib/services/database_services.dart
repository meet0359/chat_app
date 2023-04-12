// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'colud_storage_services.dart';

const String USER_COLLACTION = "Users";
const String CHAT_COLLACTION = "Chats";
const String MESSAGE_COLLACTION = "Message";

class DatabaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DatabaseServices(){}
}
