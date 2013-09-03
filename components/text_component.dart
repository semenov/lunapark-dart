part of components;

class TextComponent extends Component {
  TextComponent({String name, String text}) : super(name: name) {
    this.text = text;
  }

  get text => element.text;
  set text(text) {
    element.text = text;
  }
}
