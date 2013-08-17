import 'package:start/start.dart';
import 'dart:json' as json;
import './models/ticket.dart';

main() {
  start(public: '.', port: 31337).then((app) {

    app.get('/').listen((request) {
      request.response.sendFile('app.html');
    });

    app.get('/api/tickets/list').listen((request) {
      var ticket1 = new Ticket('Создать офигенный тикет', 'Нужно в кратчайшие сроки создать офигительный тикет.');
      var ticket2 = new Ticket('Подумать над интерфейсом вывода тикетов', 'Сейчас тикеты отображаются достаточно стремно. Надо подумать над тем как улучшить их вывод.');

      var response = [
        ticket1.serialize(),
        ticket2.serialize()
      ];

      var jsonResponse = json.stringify(response);

      request.response
        .header('Content-Type', 'application/json; charset=UTF-8')
        .send(jsonResponse);
    });

  });
  print('Listening on port 31337');
}