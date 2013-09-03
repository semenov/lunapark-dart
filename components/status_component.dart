part of components;

class StatusComponent extends Component {
  String tag = 'img';
  String _status;
  StatusComponent() {

  }

  get status => _status;
  set status(newStatus) {
    _status = newStatus;
    element.attributes['src'] = '/ticket_' + _status + '.svg';
  }


}