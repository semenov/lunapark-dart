import 'dart:html';
import 'components/components.dart';
import 'models/ticket.dart';
import 'actions.dart' as actions;
import 'dart:json' as json;

main() {
  var page = new PageComponent();
  actions.init();
  actions.page = page;
  document.body.children.add(page.element);
  var ticketListComponent = new TicketListComponent();
  page.surface.contentComponent = ticketListComponent;
}