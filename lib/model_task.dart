class Task {
  String title, description;
  String deadline; // insted of int make it String to avoid unnecessary parse()
  Task(this.title, this.description, this.deadline);
}
