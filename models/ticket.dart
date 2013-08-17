class Ticket {
  String title;
  String description;

  Ticket(this.title, this.description);

  serialize() {
    return {
      'title': title,
      'description': description
    };
  }
}