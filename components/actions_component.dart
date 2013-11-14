part of components;

class ActionsComponent extends Component {
  ButtonComponent homeButton;
  ButtonComponent newTicketButton;
  SurfaceComponent surface;

  ActionsComponent() {
    homeButton = new ButtonComponent();
    homeButton.label = 'Дом';
    homeButton.onClick = () {
      actions.showTicketsList();
    };

    addChild(homeButton);

    newTicketButton = new ButtonComponent();
    newTicketButton.label = 'Создать тикет';
    newTicketButton.onClick = () {
      actions.newTicket();
    };

    addChild(newTicketButton);
  }
}