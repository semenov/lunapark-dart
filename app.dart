import 'dart:html';
import 'components/components.dart';
import 'actions.dart' as actions;

main() {
  var page = new PageComponent();
  actions.page = page;
  document.body.append(page.element);
  actions.init();
}