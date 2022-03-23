import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final bool isMale;
  final double res;
  final int age;

  const Result(
      {Key? key, required this.isMale, required this.res, required this.age})
      : super(key: key);

  String get status {
    if (res >= 30)
      return 'Obese';
    else if (res > 25 && res <= 29.9)
      return 'Overweight';
    else if (res >= 18.5 && res <= 24.9)
      return 'Normal';
    else
      return 'Thin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Result: $res',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Healthiness: $status',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
