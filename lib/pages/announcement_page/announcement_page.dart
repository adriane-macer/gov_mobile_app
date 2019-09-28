import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:gov/blocs/announcement_bloc/announcement_state.dart';
import 'package:gov/pages/announcement_page/announcement_screen.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if(state is AnnouncementLoading || state is AnnouncementUninitialized)
          return Scaffold(body: Center(child: CircularProgressIndicator(),));
        if(state is AnnouncementLoaded){
          return AnnouncementScreen();
        }
        if(state is AnnouncementError)
          {
            return Scaffold(body: Center(child: Text("Something went wrong")));
          }
        if(state is NoAnnouncementLoaded)
          {
            return Scaffold(body: Center(child: Text("No Announcement Loaded")));
          }
        return Container();
      },
    );
  }
}