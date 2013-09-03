part of components;

class SurfaceComponent extends Component {
  String _title;

  SurfaceComponent() {
  }

  set content(newTitle) {
    _title = newTitle;
    element.text = newTitle;
  }
}