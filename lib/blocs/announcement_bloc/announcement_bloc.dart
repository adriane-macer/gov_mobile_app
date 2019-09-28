import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gov/blocs/announcement_bloc/announcement_event.dart';
import 'package:gov/blocs/announcement_bloc/announcement_state.dart';
import 'package:gov/models/announcement.dart';
import 'package:gov/services/announcement_service.dart';
import 'package:gov/services/service_locator.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {

  List<Announcement> announcements = [];

  @override
  AnnouncementState get initialState => AnnouncementUninitialized();

  @override
  Stream<AnnouncementState> mapEventToState(AnnouncementEvent event) async* {
    if(event is FetchAnnouncement){
      yield AnnouncementLoading();
      try {
        announcements = await locator<AnnouncementService>().getAnnouncements();
      } catch (e) {
        print(e);
        yield AnnouncementError(Exception("Error fetching announcement"));
      }


      if(announcements.isEmpty)
        {
          yield NoAnnouncementLoaded();
        }
      yield AnnouncementLoaded();

    }
  }
}