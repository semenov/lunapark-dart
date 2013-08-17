part of components;

class TicketTitleComponent extends Component {
  get text => element.text;
  set text(text) {
  	element.text = text;
  }
}