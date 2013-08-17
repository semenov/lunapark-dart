part of components;

class TicketListComponent extends Component {
  add(Ticket ticket) {
    addChild(new TicketPreviewComponent(ticket));
  }
}