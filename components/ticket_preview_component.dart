part of components;

class TicketPreviewComponent extends BoxComponent {
  Ticket ticket;
  TextComponent title;
  TextComponent description;
  StatusComponent status;

  TicketPreviewComponent(Ticket ticket) : super.horizontal() {
    this.ticket = ticket;

    status = new StatusComponent();
    status.status = ticket.status;

    title = new TextComponent(name: 'title', text: ticket.title);
    description = new TextComponent(name: 'description', text: ticket.description);

    var verticalBox = new BoxComponent.vertical();
    verticalBox.addChild(title);
    verticalBox.addChild(description);

    addChild(status);
    addChild(verticalBox);


    element.onClick.listen((e) {
      actions.showTicket(ticket);
    });
  }
}
