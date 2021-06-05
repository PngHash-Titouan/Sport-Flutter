import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/Cubits/on_going_workout/on_going_workout_cubit.dart';

class OnGoingWorkoutPage extends StatelessWidget {
  /// Name used to display a title.
  final String _workoutName;

  OnGoingWorkoutPage(this._workoutName) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_workoutName"),
      ),
      body: BlocBuilder<OnGoingWorkoutCubit, OnGoingWorkoutState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return Text("Loading...");
            },
            Rest: buildRest,
            ExerciseInProgress: buildExerciseInProgress,
          );
        },
      ),
    );
  }

  Widget buildRest(int secondLeft) {
    return Text("Rest : $secondLeft");
  }

  Widget buildExerciseInProgress(String imageUrl, int setCount, int currentSet, int? repCount, int? secondsRemaining) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          secondsRemaining.toString(),
          style: TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("$currentSet/$setCount")],
        ),
        Text("Image"),
        Spacer(),
        Text("imageUrl : $imageUrl"),
        Text("setCount : $setCount"),
        Text("repCount : $repCount"),
        Text("secondsRemaining : $secondsRemaining"),
        Text("current set : $currentSet"),
      ],
    );
  }
}
