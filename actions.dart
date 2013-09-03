library actions;

import 'dart:html';
import 'dart:async';
import 'components/components.dart';
import 'dart:json' as json;
import 'models/models.dart';

PageComponent page;

_processUrl(String url) {
  if (url == '/') {
    mainAction();
  } else if (url == '/tickets/new') {
    newTicket();
  }
}

_setUrl(String url) {
  if (window.location.pathname == url) return;
  print('pushing url ' + url);
  window.history.pushState(null, '', url);
}

Future _get(String url) {
  var completer = new Completer();
  HttpRequest.request('/api/' + url).then((request) {
    var response = request.responseText;
    var result = json.parse(response);
    completer.complete(result);
  });

  return completer.future;
}

init() {
  page.header.title = 'Боевые квадрокоптеры';
  window.onPopState.listen((e) => _processUrl(window.location.pathname));
}

mainAction() {
  showTicketsList();
}

showTicketsList() {
  _setUrl('/');
  _get('tickets/list').then((tickets) {
    var ticketListComponent = new TicketListComponent();

    tickets.forEach((ticketData) {
        ticketListComponent.add(new Ticket(ticketData));
    });

    page.surface.contentComponent = ticketListComponent;
  });
}

showTicket(Ticket ticket) {
  _setUrl('/ticket');
  page.surface.contentComponent = new TicketComponent(ticket);
}

newTicket() {
  _setUrl('/tickets/new');
  print('Need to make new ticket component');
  page.surface.contentComponent = new TicketEditComponent();
}