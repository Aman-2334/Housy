import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(InitialState()) {
    getMovies();
  }

  void getMovies() async {
    final Map<String, String> postbody = {
      "category": "movies",
      "language": "hindi",
      "genre": "all",
      "sort": "voting"
    };
    try {
      emit(LoadingState());
      final response = await http.post(
        Uri.parse('https://hoblist.com/movieList'),
        body: postbody,
      );
      final movies = json.decode(response.body)["result"];
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // @override
  // MovieState fromJson(Map<String, dynamic> json) =>
  //     json['value'] as MovieState;

  // @override
  // Map<String, dynamic> toJson(MovieState state) =>
  //     {'value': state};
}
