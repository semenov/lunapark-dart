part of components;

class InputComponent extends Component {
  InputComponent() {
    tag = 'input';
  }

  InputComponent.multiline() {
    tag = 'textarea';
  }
}
