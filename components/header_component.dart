part of components;

class HeaderComponent extends Component {
  String tag = 'header';
  HeaderComponent() {
    title = 'Lunapark';
  }

  String _title = '';

  get title => _title;
  set title(newTitle) {
    _title = newTitle;
    element.text = newTitle;
  }
}