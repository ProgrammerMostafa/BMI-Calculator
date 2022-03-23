import 'package:flutter/material.dart';
import 'package:flutter_bmi/result.dart';
import 'dart:math' as math;

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHomeState();
}

bool isMale = true;
int weight = 70;
int age = 20;
double height = 170.0;

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    expandedContainer1(context, 'Male'),
                    const SizedBox(
                      width: 15.0,
                    ),
                    expandedContainer1(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            ' CM',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        min: 50,
                        max: 250,
                        onChanged: (double v) {
                          setState(() {
                            height = double.parse(v.toStringAsFixed(1));
                          });
                        },
                        label: height.toString(),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    expandedContainer2(context, 'Weight'),
                    const SizedBox(
                      width: 15.0,
                    ),
                    expandedContainer2(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 12.0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      double res = weight / math.pow(height / 100, 2);
                      return Result(
                          isMale: isMale,
                          res: double.parse(res.toStringAsFixed(1)),
                          age: age);
                    }),
                  );
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded expandedContainer1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(
            () => isMale = (type == 'Male') ? true : false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male_rounded : Icons.female_rounded,
                size: 60,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded expandedContainer2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'Weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Weight' ? '--weight' : '--age',
                  onPressed: () {
                    setState(() {
                      if (type == 'Weight' && weight != 1) {
                        --weight;
                      } else if (type == 'Age' && age != 1) {
                        --age;
                      }
                    });
                  },
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                FloatingActionButton(
                  heroTag: type == 'Weight' ? '++weight' : '++age',
                  onPressed: () {
                    setState(() {
                      type == 'Weight' ? ++weight : ++age;
                    });
                  },
                  mini: true,
                  child: const Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
