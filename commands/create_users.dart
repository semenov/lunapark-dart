import 'package:mongo_dart/mongo_dart.dart';
import 'dart:async';

Db db = new Db("mongodb://127.0.0.1/lunapark");
DbCollection users = db.collection('users');

main() {
  db.open()
    .then((_) => createUsers())
    .then((_) => db.close());
}

Future createUsers() {
  return Future.wait([
    createUser('Влад Семенов'),
    createUser('Стив Джобс'),
    createUser('Билл Гейтс')
  ]);
}

createUser(String name) {
  return users.insert({
    'name': name
  }).then((_){
    print('User created: ' + name);
  });
}