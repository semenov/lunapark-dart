part of components;

class SurfaceComponent extends Component {
  SurfaceComponent() {
  }

  set content(newTitle) {
    _title = newTitle;
    element.text = newTitle;
  }
}