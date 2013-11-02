import 'models/models.dart';
import 'dart:async';
import 'dart:html';
import 'dart:convert';

Future _call(String url, [Map data]) {
  if (data == null) data = {};
  var dataString = JSON.encode(data);
  var headers = {
    'Content-Type': 'application/json;charset=UTF-8'
  };
  return HttpRequest.request('/api/' + url, method: 'POST', requestHeaders: headers, sendData: dataString).then((request) {
    return JSON.decode(request.responseText);
  });
}

Future getTicketList() {
  return _call('tickets/list').then((result) {
    var tickets = result['tickets'].map((ticketData) => new Ticket(ticketData));

    return tickets;
  });
}

Future createTicket(Ticket ticket) {
  return _call('tickets/create', ticket.serialize());
}