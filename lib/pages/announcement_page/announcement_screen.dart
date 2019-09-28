import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:gov/models/announcement.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    final AnnouncementBloc bloc = BlocProvider.of<AnnouncementBloc>(context);
    final List<Announcement> announcements = bloc.announcements;

    debugPrint("${announcements.length}");
    return Scaffold(
        appBar: AppBar(
          title: Text("Disater relief announcement"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset("${announcements[index].mediaPath}", height: 160),
                    Text(
                      "${announcements[index].content}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Posted on ${announcements[index].dtPosted}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: announcements.length,
        ));
  }
}
