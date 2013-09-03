part of models;

class Ticket {
  String title;
  String description;
  String status;

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
}