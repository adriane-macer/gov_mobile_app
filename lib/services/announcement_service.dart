import 'package:gov/models/announcement.dart';

class AnnouncementService {
  List<Announcement> _announcements = [
    Announcement(
      "0",
      "Content 1",
      "assets/images/disaster_1.png",
      "September 26, 2019",
    ),
    Announcement(
      "1",
      "Content 2",
      "assets/images/disaster_2.png",
      "September 11, 2019",
    ),
    Announcement(
      "2",
      "Content 3",
      "assets/images/disaster_3.png",
      "September 1, 2019",
    ),
    Announcement(
      "3",
      "Content 4",
      "assets/images/disaster_4.png",
      "July 5, 2019",
    ),
    Announcement(
        "4", "Content 5", "assets/images/disaster_5.png", "June 6, 2019"),
    Announcement(
        "5", "Content 6", "assets/images/disaster_1.png", "April 12, 2019"),
    Announcement(
        "6", "Content 7", "assets/images/disaster_8.png", "January 6, 2019"),
    Announcement(
      "7",
      "Content 8",
      "assets/images/disaster_5.png",
      "December 10, 2018",
    ),
    Announcement(
      "8",
      "Content 9",
      "assets/images/disaster_6.png",
      "October 11, 2018",
    ),
    Announcement(
      "9",
      "Content 10",
      "assets/images/disaster_7.png",
      "September 28, 2018",
    ),
  ];

  Future<List<Announcement>> getAnnouncements() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _announcements;
  }
}
