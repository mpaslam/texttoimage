import 'package:flutter/material.dart';

@immutable
abstract class AnimeEvent {}

class FetchAnimeEvent extends AnimeEvent {
  final String message;
   FetchAnimeEvent({required this.message});
  
}