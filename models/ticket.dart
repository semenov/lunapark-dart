part of models;

class Ticket {
  String title;
  String description;
  String status;
  String id;

  static const OPEN = 'open';
  static const IN_PROGRESS = 'in_progress';
  static const DONE = 'done';


  Ticket([Map data]) {
    if (data != null) {
      title = data['title'];
      description = data['description'];
      status = data['status'];
      id = data['_id'];
    }
  }

  serialize() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'status': status
    };
  }

  toJson() => serialize();
}