import 'dart:math';
import 'package:bmi_app_trail/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 170;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body Mass Index'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('Height' ,style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children:  [
                          Text('${height.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
                          Text('CM',style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: height,
                        onChanged: (newValue) {
                          setState(() => height=newValue);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(
                      width: 10,
                    ),
                    m2Expanded(context, 'age'),

                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow((height / 100), 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: isMale, age: age),
                    ),
                  );
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              type == 'male'
                  ? const Icon(Icons.male, size: 90)
                  : const Icon(Icons.female, size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() => type == 'age' ? age-- : weight--);
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(width: 15),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() => type == 'age' ? age++ : weight++);
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),

              ],

            ),
          ],
        ),
      ),
    );
  }
}
