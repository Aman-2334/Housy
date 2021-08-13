import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Movies {
  final movie;
  final retry = "https://static.thenounproject.com/png/726841-200.png";
  Movies(this.movie);

  Widget text(String title) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String date(timestamp) {
    return DateFormat("d MMM")
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  Widget movieTiles(context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.caretUp,
                      ),
                    ),
                    Text('${movie["voting"]}'),
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.caretDown,
                      ),
                    ),
                    Text('Votes')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 150,
                width: 100,
                child: Image.network(
                    movie["poster"].length != 0 ? movie["poster"] : retry),
              ),
              Container(
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      child: Text(
                        '${movie["title"]}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    text('Gener: ${movie["genre"]}'),
                    text('Director: ${movie["director"].join(",")}'),
                    text('Starring: ${movie["stars"].join(",")}'),
                    text(
                        '${movie["runTime"] != null && movie["runTime"] > 0 ? "${movie["runTime"]} Mins" : "none"} | ${movie["language"]} | ${date(movie["releasedDate"])}'),
                    text(
                        '${movie["pageViews"]} views | Voted by ${movie["totalVoted"]} People'),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 30,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Watch Trailer',
                style: Theme.of(context).textTheme.button,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    return Theme.of(context).buttonColor;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
