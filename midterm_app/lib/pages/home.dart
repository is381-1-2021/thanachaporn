import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moddish'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icon.png',
              width: 100,
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/8');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Monthly Mood ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.today,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/7');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Daily Mood ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.face,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Task ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.task_alt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/5');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Store ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.store,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/10');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Quote ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.format_quote,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/11');
              },
              child: Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Activity ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.celebration,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ]),
    );
  }
}
