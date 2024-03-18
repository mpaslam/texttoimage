
import 'package:flutter/material.dart';

@immutable

abstract class AnimeState {}

class AnimeInitial extends AnimeState {}
class AnimeblocLoading extends AnimeState {}
class AnimeblocLoaded extends AnimeState {}
class AnimeblocError extends AnimeState{}