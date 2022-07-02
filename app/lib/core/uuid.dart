import 'package:uuid/uuid.dart';

var uuid = const Uuid();

String createUUID() {
  return uuid.v4();
}
