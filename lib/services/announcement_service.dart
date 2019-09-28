import 'package:gov/models/announcement.dart';

class AnnouncementService {
  List<Announcement> _announcements = [
    Announcement(
      "0",
      "Content 1",
      "",
      "September 26, 2019",
    ),
    Announcement(
      "1",
      "Content 2",
      "",
      "September 11, 2019",
    ),
    Announcement(
      "2",
      "Content 3",
      "",
      "September 1, 2019",
    ),
    Announcement(
      "3",
      "Content 4",
      "",
      "July 5, 2019",
    ),
    Announcement("4", "Content 5", "", "June 6, 2019"),
    Announcement("5", "Content 6", "", "April 12, 2019"),
    Announcement("6", "Content 7", "", "January 6, 2019"),
    Announcement(
      "7",
      "Content 8",
      "",
      "December 10, 2018",
    ),
    Announcement(
      "8",
      "Content 9",
      "",
      "October 11, 2018",
    ),
    Announcement(
      "9",
      "Content 10",
      "",
      "September 28, 2018",
    ),
  ];

  Future<List<Announcement>> getAnnouncements() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _announcements;
  }
}
