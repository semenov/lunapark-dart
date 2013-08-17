part of components;

class TicketDescriptionComponent extends Component {
  get text => element.text;
  set text(text) {
  	element.text = text;
  }
}