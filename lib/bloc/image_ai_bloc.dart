import 'package:bloc/bloc.dart';
import 'package:texttoimage/bloc/image_ai_event.dart';
import 'package:texttoimage/bloc/image_ai_state.dart';
import 'package:texttoimage/repositary/api/api_calling.dart';
import 'package:texttoimage/repositary/model/model.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late Model animeModel;
  ImagineApi animeApi = ImagineApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<FetchAnimeEvent>((event, emit) async {
      emit(AnimeblocLoading());
      try {
        animeModel = await animeApi.getTranslate(event.message);
        emit(AnimeblocLoaded());
      } catch (e) {
        print(e);
        emit(AnimeblocError());
      }
    });
  }
}
