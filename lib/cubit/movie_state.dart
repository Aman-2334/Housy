part of 'movie_cubit.dart';

@immutable
abstract class MovieState {
  const MovieState();
}

class InitialState extends MovieState {
  @override
  List<Object> get props => [];
}
class LoadingState extends MovieState {
  @override
  List<Object> get props => [];
}
class LoadedState extends MovieState {
  LoadedState(this.movies);
  
  final dynamic movies;
  
  @override
  List<Object> get props => [movies];
}
class ErrorState extends MovieState {
  @override
  List<Object> get props => [];
}
