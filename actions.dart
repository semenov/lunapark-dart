import 'dart:html';
import 'components/components.dart';

PageComponent page;

init() {
  window.onPopState.listen((e) {
    print(window.location.pathname);
  }); 
}

showTicketsList('/', () {
	HttpRequest.request('/api/tickets/list').then((request) {
    var response = request.responseText;
    var tickets = json.parse(response);

    tickets.forEach((ticketData) {
        ticketListComponent.add(new Ticket(ticketData['title'], ticketData['description']));     
    });
  });
});


showTicket(Ticket ticket) {
  window.history.pushState(null, '', '/ticket');
  page.surface.contentComponent = new TicketComponent(ticket);
}