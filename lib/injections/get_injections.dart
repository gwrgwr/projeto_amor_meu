import 'package:aplicativo_maria/data/sqflite_data.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.instance.registerSingleton<SqfliteData>(SqfliteData());
}