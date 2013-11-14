part of components;

class TicketEditComponent extends BoxComponent {
  EditableComponent title;
  EditableComponent description;
  ButtonComponent saveButton;
  String ticketId;

  TicketEditComponent([Ticket ticket]) : super.vertical() {
    semantic = true;

    title = new EditableComponent(name: 'title', placeholder: 'Название тикета');

    description = new EditableComponent(name: 'description', placeholder: 'Подробное описание тикета');

    saveButton = new ButtonComponent(name: 'saveButton', label: 'Сохранить');
    saveButton.onClick = submit;
    print('Ticket constructor');
    if (ticket != null) {
      print('Ticket not null');
      ticketId = ticket.id;
      print(ticket.title);
      title.content = ticket.title;
      description.content = ticket.description;
    }

    addChild(title);
    addChild(description);
    addChild(saveButton);
  }

  submit() {
    var ticket = new Ticket();
    ticket.id = ticketId;
    ticket.title = title.content;
    ticket.description = description.content;
    ticket.status = 'open';
    if (ticketId == null) {
      api.createTicket(ticket).then((_) {
        actions.showTicketsList();
      });
    } else {
      api.updateTicket(ticket).then((_) {
        actions.showTicketsList();
      });
    }
  }
}