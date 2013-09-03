part of components;

class ActionsComponent extends Component {
  ButtonComponent newTicketButton;
  SurfaceComponent surface;

  ActionsComponent() {
    newTicketButton = new ButtonComponent();
    newTicketButton.label = 'Создать тикет';
    newTicketButton.onClick = () {
      actions.newTicket();
    };

    addChild(newTicketButton);
  }
}