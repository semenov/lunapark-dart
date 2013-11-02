import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'models/models.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http_server/http_server.dart';

var router = {
//  '/api/tickets/list': (data) {
//    return new Future(() {
//      var ticket1 = new Ticket();
//      ticket1.title = 'Создать офигенный тикет';
//      ticket1.description = 'Нужно в кратчайшие сроки создать офигительный тикет!';
//      ticket1.status = 'done';
//
//
//      var ticket2 = new Ticket();
//      ticket2.title = 'Подумать над интерфейсом вывода тикетов';
//      ticket2.description = 'Сейчас тикеты отображаются достаточно стремно. Надо подумать над тем как улучшить их вывод.';
//      ticket2.status = 'in_progress';
//
//      var ticket3 = new Ticket();
//      ticket3.title = 'Разработать иконки статусов';
//      ticket3.description = 'Иконки должны быть простыми, стильными и инуитивно понятными.';
//      ticket3.status = 'open';
//
//      var response = [
//        ticket1.serialize(),
//        ticket2.serialize(),
//        ticket3.serialize()
//      ];
//
//      return response;
//    });
//  },


  '/api/tickets/list': (data) {

    return db.collection('tickets').find().toList().then((ticketMaps) {
      var tickets = ticketMaps.map((ticketMap) => new Ticket(ticketMap)).toList();
      return {
        'tickets': tickets
      };
    });
  },

  '/api/tickets/create': (data) {
    var now = new DateTime.now();
    data['created_at'] = now;
    data['updated_at'] = now;
    return db.collection('tickets').insert(data).then((_) {
        return {'status': 'ok!'};
    });
  }
};

sendFile(String filePath, HttpResponse response) {
  File file = new File(filePath);
  file.openRead().pipe(response);
}

Db db = new Db("mongodb://127.0.0.1/lunapark");

main() {
  db.open().then((_) {
    return HttpServer.bind('127.0.0.1', 31337);
  }).then((server) {
    server.listen((HttpRequest request) {
      var url = request.uri.path;
      Function method = router[url];

      if (method != null) {
        HttpBodyHandler.processRequest(request).then((HttpRequestBody requestBody) {
          method(requestBody.body).then((Map result) {
            var jsonResponse = JSON.encode(result);

            request.response
              ..headers.contentType = new ContentType('application', 'json', charset: 'utf-8')
              ..write(jsonResponse)
              ..close();
          });
        });
      } else {
        sendFile('app.html', request.response);
      }
    });
  });

  print('Listening on port 31337');
}