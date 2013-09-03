part of components;

class TicketComponent extends Component {
  Ticket ticket;
  TicketTitleComponent title;
  TicketDescriptionComponent description;

  TicketComponent(Ticket ticket) {
    this.ticket = ticket;
    title = new TicketTitleComponent();
    title.text = ticket.title;
    description = new TicketDescriptionComponent();
    description.text = ticket.description;
    addChild(title);
    addChild(description);
  }
}
