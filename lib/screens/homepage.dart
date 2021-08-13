import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housy/cubit/movie_cubit.dart';
import '../cubit/registration_cubit.dart';
import 'package:housy/models/movies.dart';
import '../models/HomeDrawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('HomePage ran');
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: Text('Shows'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is LoadingState) {
            print('LoadingState');
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            print('ErrorState');
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            // final movies = state.movies;
            print('LoadedState');
            final List movies = state.movies;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Movies(movies[index]).movieTiles(context);
                },
                itemCount: movies.length);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
