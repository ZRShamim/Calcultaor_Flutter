import 'package:flutter/material.dart';

void main() {
  runApp(const RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PTSans',
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3a4764),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Top Sec
              Row(
                children: const [
                  Text('Calc'),
                  Text('Theme'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // Result Sec
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: const Color(0xff192030),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Button Sec
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: const Color(0xff242e42),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NumBtn(
                          string: '7',
                        ),
                        NumBtn(
                          string: '8',
                        ),
                        NumBtn(
                          string: '9',
                        ),
                        NumBtn(
                          string: 'DEL',
                          color: Color(0xff3a4764),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NumBtn(
                          string: '4',
                        ),
                        NumBtn(
                          string: '5',
                        ),
                        NumBtn(
                          string: '6',
                        ),
                        NumBtn(
                          string: '+',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NumBtn(
                          string: '1',
                        ),
                        NumBtn(
                          string: '2',
                        ),
                        NumBtn(
                          string: '3',
                        ),
                        NumBtn(
                          string: '-',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NumBtn(
                          string: '.',
                        ),
                        NumBtn(
                          string: '0',
                        ),
                        NumBtn(
                          string: '/',
                        ),
                        NumBtn(
                          string: 'X',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NumBtn(
                          string: 'RESET',
                          widthFactor: 2,
                          color: Color(0xff3a4764),
                        ),
                        NumBtn(
                          string: '=',
                          widthFactor: 2,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumBtn extends StatelessWidget {
  const NumBtn(
      {Key? key,
      required this.string,
      this.color = Colors.white,
      this.widthFactor = 1})
      : super(key: key);

  final double widthFactor;
  final Color color;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80 * widthFactor, //Change
      height: 70,
      decoration: BoxDecoration(
        color: color, //Change
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.white30,
            spreadRadius: -3,
            blurRadius: 3,
            offset: Offset(2, 8), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          string,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), //Change
    );
  }
}
