library components;

import 'dart:html';
import '../models/models.dart';
import '../actions.dart' as actions;

part 'header_component.dart';
part 'surface_component.dart';
part 'page_component.dart';
part 'button_component.dart';
part 'text_component.dart';
part 'ticket_component.dart';
part 'ticket_list_component.dart';
part 'ticket_preview_component.dart';
part 'ticket_title_component.dart';
part 'ticket_description_component.dart';
part 'actions_component.dart';
part 'status_component.dart';
part 'box_component.dart';
part 'ticket_edit_component.dart';

class Component {
  Element element;
  String tag = 'div';
  String name;
  Component _contentComponent;

  Component({String name}) {
    this.name = name;
    element = new Element.tag(tag);
    element.classes.add(componentName);
    if (name != null) {
      element.classes.add(name);
    }
  }

  get contentComponent => _contentComponent;
  set contentComponent(component) {
    _contentComponent = component;
    element.children.clear();
    element.children.add(component.element);
  }

  String get componentName => this.runtimeType.toString();

  addChild(Component component) {
    element.children.add(component.element);
  }

}