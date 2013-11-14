part of components;

class EditableComponent extends Component {
  String placeholder = '';
  bool placeholderActive = false;
  String _content = '';
  bool _active = false;
  EditableComponent({String name, String placeholder}) : super(name: name) {
    element.contentEditable = 'true';

    this.placeholder = placeholder;

    checkPlaceholder();

    element.onFocus.listen((e) {
      _active = true;
      checkPlaceholder();
    });

    element.onBlur.listen((e) {
      _active = false;
      checkPlaceholder();
    });

    element.onKeyUp.listen((e) {
      if (!placeholderActive) {
        content = element.text;
      }
    });

  }

  checkPlaceholder() {
    if (!_active && content.isEmpty) {
      placeholderActive = true;
      addModifier('placeholder');
      element.text = placeholder;
    }

    if (_active || !content.isEmpty) {
      removeModifier('placeholder');
      if (element.text != content) {
        element.text = content;
      }
      placeholderActive = false;
    }
  }

  set content(newContent) {
    _content = newContent;
    checkPlaceholder();
  }

  String get content => _content;

}