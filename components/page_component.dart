part of components;

class PageComponent extends Component {
  HeaderComponent header;
  SurfaceComponent surface;

  PageComponent() {
    header = new HeaderComponent();
    surface = new SurfaceComponent();
    element.children.add(header.element);
    element.children.add(surface.element);
  }
}