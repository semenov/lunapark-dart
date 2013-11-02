part of components;

class EditableComponent extends Component {
  String placeholder = '';
  String content = '';
  EditableComponent({String name, String placeholder}) : super(name: name) {
    element.contentEditable = 'true';

    this.placeholder = placeholder;

    if (content.isEmpty) {
      showPlaceholder();
    }

    element.onFocus.listen((e) {
      if (content.isEmpty) {
        hidePlaceholder();
      }
    });

    element.onBlur.listen((e) {
      if (element.text.isEmpty) {
        showPlaceholder();
        content = '';
      } else {
        content = element.text;
      }
    });

  }

  showPlaceholder() {
    addModifier('placeholder');
    element.text = placeholder;
  }

  hidePlaceholder() {
    removeModifier('placeholder');
    element.text = '';
  }
}