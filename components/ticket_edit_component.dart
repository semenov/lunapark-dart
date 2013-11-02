part of components;

class TicketEditComponent extends BoxComponent {
  EditableComponent title;
  EditableComponent description;
  ButtonComponent saveButton;

  TicketEditComponent() : super.vertical() {
    semantic = true;

    title = new EditableComponent(name: 'title', placeholder: 'Название тикета');

    description = new EditableComponent(name: 'description', placeholder: 'Подробное описание тикета');

    saveButton = new ButtonComponent(name: 'saveButton', label: 'Сохранить');
    saveButton.onClick = submit;

    addChild(title);
    addChild(description);
    addChild(saveButton);

  }

  submit() {
    var ticket = new Ticket();
    ticket.title = title.content;
    ticket.description = description.content;
    ticket.status = 'open';
    api.createTicket(ticket).then((result) {
      actions.showTicketsList();
    });
  }
}