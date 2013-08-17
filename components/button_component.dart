part of components;

class ButtonComponent extends Component {
  String tag = 'button';

  ButtonComponent() {
    label = 'Сохранить';
    element.onClick.listen((e) {
      label = this.runtimeType.toString() + 'Clicked';
    });
  }

  set label(String text) => element.text = text;
}