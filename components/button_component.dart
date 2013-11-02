part of components;

class ButtonComponent extends Component {
  String tag = 'button';
  Function onClick = () => false;

  ButtonComponent({String name, String label}) : super(name: name) {
    this.label = label;
    element.onClick.listen((e) {
      onClick();
    });
  }

  set label(String text) => element.text = text;
}