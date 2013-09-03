part of components;

class BoxComponent extends Component {
  BoxComponent([String orientation = 'row']) {
    element.style.display = 'flex';
    element.style.flexFlow = orientation;
  }

  BoxComponent.horizontal() : this('row');
  BoxComponent.vertical() : this('column');
}