library actions;

import 'dart:html';
import 'api.dart' as api;
import 'dart:async';
import 'components/components.dart';
import 'models/models.dart';

PageComponent page;

void _processUrl(String url) {
  if (url == '/') {
    mainAction();
  } else if (url == '/tickets/new') {
    newTicket();
  }
}

void _setUrl(String url) {
  if (window.location.pathname == url) return;
  print('pushing url ' + url);
  window.history.pushState(null, '', url);
}



void init() {
  page.header.title = 'Боевые квадрокоптеры';
  window.onPopState.listen((e) => _processUrl(window.location.pathname));
}

void mainAction() {
  showTicketsList();
}

void showTicketsList() {
  _setUrl('/');
  api.getTicketList().then((tickets) {
    var ticketListComponent = new TicketListComponent();

    tickets.forEach(ticketListComponent.add);

    page.surface.contentComponent = ticketListComponent;
  });
}

void showTicket(Ticket ticket) {
  _setUrl('/ticket');
  page.surface.contentComponent = new TicketComponent(ticket);
}

void newTicket() {
  _setUrl('/tickets/new');
  page.surface.contentComponent = new TicketEditComponent();
}