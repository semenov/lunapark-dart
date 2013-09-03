part of components;

class ButtonComponent extends Component {
  String tag = 'button';
  Function onClick;

  ButtonComponent() {
    label = 'Сохранить';
    element.onClick.listen((e) {
      onClick();
    });
  }

  set label(String text) => element.text = text;
}