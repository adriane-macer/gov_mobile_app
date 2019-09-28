class Announcement {
  final id;
  final content;
  final mediaPath;
  final dtPosted;

  Announcement(this.id, this.content, this.mediaPath, this.dtPosted);

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
      json['id'], json['content'], json['media_path'], json['dt_posted']);
}
