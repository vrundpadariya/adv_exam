class likeMOdel {
  int? id;
  String notetitle;
  String notes;

  likeMOdel({required this.notes, required this.notetitle, this.id});

  factory likeMOdel.fromDB({required Map<String, dynamic> data}) {
    return likeMOdel(
      id: data['id'],
      notetitle: data['notetitle'],
      notes: data['notes'],
    );
  }
}
