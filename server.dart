import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:mirrors';
import 'models/models.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http_server/http_server.dart';

typedef Future<Map> RouteAction(Map data);


class TicketsController {
  list(data) {
    return ticketsCollection.find(where.sortBy('created_at', descending: true)).toList().then((ticketMaps) {
      var tickets = ticketMaps.map((ticketMap) {
        ticketMap['_id'] = ticketMap['_id'].toHexString();
        return new Ticket(ticketMap);
      }).toList();
      return {
        'tickets': tickets
      };
    });
  }

  get(data) {
    return ticketsCollection.findOne({'_id': ObjectId.parse(data['id'])}).then((ticketMap) {
      ticketMap['_id'] = ticketMap['_id'].toHexString();
      return {
        'ticket': new Ticket(ticketMap)
      };
    });
  }

  create(Map data) {
    var now = new DateTime.now();
    data['created_at'] = now;
    data['updated_at'] = now;
    data.remove('_id');
    return ticketsCollection.insert(data).then((_) {
      return {'status': 'ok'};
    });
  }

  update(data) {
    var now = new DateTime.now();
    var id = ObjectId.parse(data['_id']);
    data.remove('_id');
    data['updated_at'] = now;
    return ticketsCollection.update({'_id': id}, {r'$set': data}).then((_) {
      return {'status': 'ok'};
    });
  }

  setStatus(data) {
    return ticketsCollection.update({'_id': ObjectId.parse(data['id'])}, modify.set('status', data['status'])).then((_) {
      return {'status': 'ok'};
    });
  }

  delete(data) {
    return ticketsCollection.remove({'_id': ObjectId.parse(data['id'])}).then((_) {
      return {'status': 'ok'};
    });
  }
}


//Map<String, RouteAction> router = {
//  '/api/tickets/list': listTickets,
//  '/api/tickets/get': getTicket,
//  '/api/tickets/create': createTicket,
//  '/api/tickets/update': updateTicket,
//  '/api/tickets/set-status': setTicketStatus,
//  '/api/tickets/delete': deleteTicket,
//};

invokeApiMethod(String controllerName, String actionName, Map data) {
  var controller = controllers[controllerName];
  var controllerMirror = reflect(controller);
  return controllerMirror.invoke(new Symbol(actionName), [data]).reflectee;
}

sendFile(String filePath, HttpResponse response) {
  File file = new File(filePath);
  file.openRead().pipe(response);
}

Db db = new Db("mongodb://127.0.0.1/lunapark");
DbCollection ticketsCollection = db.collection('tickets');
var controllers = {
  'tickets': new TicketsController()
};

main() {
  db.open().then((_) {
    return HttpServer.bind('127.0.0.1', 31337);
  }).then((server) {
    server.listen((HttpRequest request) {
      var url = request.uri.path;
      var urlParts = url.split('/');
      if (urlParts[1] != 'api') {
        sendFile('app.html', request.response);
      } else {
        var controllerName = urlParts[2];
        var actionName = urlParts[3];
        HttpBodyHandler.processRequest(request).then((HttpRequestBody requestBody) {
          var data = requestBody.body;
          try {
            invokeApiMethod(controllerName, actionName, data).then((Map result) {
              var jsonResponse = JSON.encode(result);
              request.response
                ..headers.contentType = new ContentType('application', 'json', charset: 'utf-8')
                ..write(jsonResponse)
                ..close();
            });
          } catch(_) {
            request.response
              ..statusCode = 404
              ..close();
          }
        });
      }

    });
  });

  print('Listening on port 31337');
}