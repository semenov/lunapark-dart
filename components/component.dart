part of components;

class Component {
  Element element;
  String tag = 'div';
  String name;
  Component _contentComponent;
  Component parent;
  bool semantic = false;
  List<Component> children = [];

  Component({String name}) {
    this.name = name;
    element = new Element.tag(tag);
    element.classes.add(componentName);
  }

  get contentComponent => _contentComponent;
  set contentComponent(component) {
    _contentComponent = component;
    element.children.clear();
    element.children.add(component.element);
  }

  Component get semanticParent {
    if (parent != null) {
      if (parent.semantic) {
        return parent;
      } else {
        return parent.semanticParent;
      }
    }
  }

  String get componentName => this.runtimeType.toString();

  addChild(Component component) {
    children.add(component);
    component.parent = this;
    component.addHierarchyClass();

    element.children.add(component.element);
  }

  addHierarchyClass() {
    if (semanticParent != null ) {
      if (name != null) {
          var className = semanticParent.componentName + '-' + name;
          element.classes.add(className);
      }

      if (!semantic) {
        children.forEach((child) {
          child.addHierarchyClass();
        });
      }
    }
  }

  addModifier(modifier) {
    element.classes.add(modifier);
  }

  removeModifier(modifier) {
    element.classes.remove(modifier);
  }

}