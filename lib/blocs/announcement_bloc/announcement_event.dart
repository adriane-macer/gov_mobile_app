import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AnnouncementEvent extends Equatable {
  AnnouncementEvent([List props = const []]) : super(props);
}

class FetchAnnouncement extends AnnouncementEvent {

  @override
  String toString() => 'FetchAnnouncement';
}

class RefreshAnnouncement extends AnnouncementEvent {

  @override
  String toString() => 'RefreshAnnouncement';
}

