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

    var reopenButton = new ButtonComponent();
    reopenButton.label = 'Переоткрыть';
    reopenButton.onClick = () {
      api.setTicketStatus(ticket.id, Ticket.OPEN).then((_) {
        actions.showTicketsList();
      });
    };

    addChild(reopenButton);


    var startButton = new ButtonComponent();
    startButton.label = 'Начать работу';
    startButton.onClick = () {
      api.setTicketStatus(ticket.id, Ticket.IN_PROGRESS).then((_) {
        actions.showTicketsList();
      });
    };

    addChild(startButton);

    var doneButton = new ButtonComponent();
    doneButton.label = 'Закрыть';
    doneButton.onClick = () {
      api.setTicketStatus(ticket.id, Ticket.DONE).then((_) {
        actions.showTicketsList();
      });
    };

    addChild(doneButton);

    var editButton = new ButtonComponent();
    editButton.label = 'Редактировать';
    editButton.onClick = () {
      actions.editTicket(ticket.id);
    };

    addChild(editButton);

    var deleteButton = new ButtonComponent();
    deleteButton.label = 'Удалить';
    deleteButton.onClick = () {
      api.deleteTicket(ticket.id).then((_) {
        actions.showTicketsList();
      });
    };

    addChild(deleteButton);
  }
}
