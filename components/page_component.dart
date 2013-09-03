part of components;

class PageComponent extends Component {
  HeaderComponent header;
  ActionsComponent actions;
  SurfaceComponent surface;

  PageComponent() {
    header = new HeaderComponent();
    surface = new SurfaceComponent();
    actions = new ActionsComponent();
    addChild(header);
    addChild(actions);
    addChild(surface);
  }
}