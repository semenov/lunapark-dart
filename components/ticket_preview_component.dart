part of components;

class TicketPreviewComponent extends Component {
  Ticket ticket;
  TicketTitleComponent title;
  TicketDescriptionComponent description;

  TicketPreviewComponent(Ticket ticket) {
    this.ticket = ticket;
    title = new TicketTitleComponent();
    title.text = ticket.title;
    description = new TicketDescriptionComponent();
    description.text = ticket.description;
    addChild(title);
    addChild(description);

    element.onClick.listen((e) {
      actions.showTicket(ticket);
    });
  }
}
