import 'dart:json' as json;
import 'dart:io';
import 'models/models.dart';
import 'package:mongo_dart/mongo_dart.dart';

var router = {
  '/api/tickets/list': (HttpRequest request) {

      var ticket1 = new Ticket();
      ticket1.title = 'Создать офигенный тикет';
      ticket1.description = 'Нужно в кратчайшие сроки создать офигительный тикет.';
      ticket1.status = 'done';

      var ticket2 = new Ticket();
      ticket2.title = 'Подумать над интерфейсом вывода тикетов';
      ticket2.description = 'Сейчас тикеты отображаются достаточно стремно. Надо подумать над тем как улучшить их вывод.';
      ticket2.status = 'in_progress';

      var ticket3 = new Ticket();
      ticket3.title = 'Разработать иконки статусов';
      ticket3.description = 'Иконки должны быть простыми, стильными и инуитивно понятными.';
      ticket3.status = 'open';

      var response = [
        ticket1.serialize(),
        ticket2.serialize(),
        ticket3.serialize()
      ];

      var jsonResponse = json.stringify(response);

      request.response
        //.header('Content-Type', 'application/json; charset=UTF-8')
        .write(jsonResponse);
      request.response.close();
    }
};

sendFile(String filePath, HttpResponse response) {
  File file = new File(filePath);
  file.openRead().pipe(response);
}

main() {
  Db db = new Db("mongodb://127.0.0.1/lunapark");
  db.open().then((_) {
    return HttpServer.bind('127.0.0.1', 31337);
  }).then((server) {
    server.listen((HttpRequest request) {
      var url = request.uri.path;
      Function method = router[url];

      if (method != null) {
        method(request);
      } else {
        sendFile('app.html', request.response);
      }
    });
  });

  print('Listening on port 31337');
}