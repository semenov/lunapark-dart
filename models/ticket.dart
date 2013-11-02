part of models;

class Ticket {
  String title;
  String description;
  String status;

  static const OPEN = 'open';
  static const IN_PROGRESS = 'in_progress';
  static const DONE = 'done';


  Ticket([Map data]) {
    if (data != null) {
      title = data['title'];
      description = data['description'];
      status = data['status'];
    }
  }

  serialize() {
    return {
      'title': title,
      'description': description,
      'status': status
    };
  }

  toJson() => serialize();
}