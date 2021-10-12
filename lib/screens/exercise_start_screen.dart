import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/screens/exercie_hub.dart';
import 'package:fitness_app/screens/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartScreen({required this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: "widget.exercises.id",
          // child: Image(
          //   image: NetworkImage(widget.exercises.thumbnail),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   fit: BoxFit.cover,
          // ),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: (widget.exercises.thumbnail).toString(),
                placeholder: (context, url) => Image(
                  image: AssetImage("assets/placeholder.jpg"),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Color(0x00000000),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  width: 150,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double value) {
                      seconds = value.toInt();
                    },
                    initialValue: 30,
                    min: 10,
                    max: 60,
                    innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${v.toInt()} S",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseScreen(
                                  exercises: widget.exercises,
                                  seconds: seconds,
                                )));
                  },
                  child: Text(
                    "Start ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  splashColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
