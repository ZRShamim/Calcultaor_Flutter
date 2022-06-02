import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  var calcMainString = ''.obs;
  var calcSubString = ''.obs;
  var tempNum = ''.obs;
  var num1 = ''.obs;
  var num2;
  var result = 0.0.obs;
  var signFlag = false.obs;
  String arithmaticOperator = '';

  // _calculate(double a, double b) {
  //   return (a + b).toString();
  // }

  void _additionFunc(String string) {
    if (signFlag.value) {
      // calcMainString.value = '${calcMainString.value} $string ';
      if (string.isNum) {
        signFlag.value = false;
        calcSubString.value =
            (int.parse(num1.value) + int.parse(tempNum.value)).toString();
      } else {
        // result.value = result.value + double.parse(tempNum.value);
        // num1.value = result.value.toString();
        // tempNum.value = '';
        if (calcSubString.isNotEmpty) {
          num1.value = calcSubString.value;
          tempNum.value = '';
        } else {
          num1.value = tempNum.value;
          tempNum.value = '';
        }
      }
    }
  }

  void _getString(String string) {
    signFlag.value = true;
    if (calcMainString.value != '0') {
      if (string.isNum) {
        tempNum.value = '${tempNum.value}$string';
      } else {
        arithmaticOperator = string;
      }

      calcMainString.value = '${calcMainString.value}$string';
      if (num1.value.isNotEmpty && tempNum.value.isNotEmpty) {
        if (arithmaticOperator == '+') {
          _additionFunc(string);
        } else if (arithmaticOperator == '-') {
          _subtractionFunc(string);
        } else if (arithmaticOperator == 'x') {
          _multiplicatonFunc(string);
        }
      }
    } else {
      if (string == '0') {
        calcMainString.value = '0';
        tempNum.value = '0';
      } else {
        tempNum.value =
            tempNum.value == '0' ? string : '${tempNum.value}$string';
        calcMainString.value = tempNum.value;
      }
    }
  }

  void _subtractionFunc(String string) {
    if (signFlag.value) {
      // calcMainString.value = '${calcMainString.value} $string ';
      if (string.isNum) {
        signFlag.value = false;
        calcSubString.value =
            (int.parse(num1.value) - int.parse(tempNum.value)).toString();
        // result.value = double.parse(calcSubString.value);
      } else {
        // result.value = result.value - double.parse(tempNum.value);
        // num1.value = result.value.toString();
        if (calcSubString.isNotEmpty) {
          num1.value = calcSubString.value;
          tempNum.value = '';
        } else {
          num1.value = tempNum.value;
          tempNum.value = '';
        }
      }
    }
  }

  void _multiplicatonFunc(String string) {
    if (signFlag.value) {
      // calcMainString.value = '${calcMainString.value} $string ';
      if (string.isNum) {
        signFlag.value = false;
        calcSubString.value =
            (int.parse(num1.value) * int.parse(tempNum.value)).toString();
        // result.value = double.parse(calcSubString.value);
      } else {
        // result.value = result.value - double.parse(tempNum.value);
        // num1.value = result.value.toString();
        if (calcSubString.isNotEmpty) {
          num1.value = calcSubString.value;
          tempNum.value = '';
        } else {
          num1.value = tempNum.value;
          tempNum.value = '';
        }
      }
    }
  }

  void _resetFunc() {
    calcMainString.value = '';
    calcSubString.value = '';
    tempNum.value = '';
    num1.value = '';
    result.value = 0;
    signFlag.value = false;
  }

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
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff192030),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            calcMainString.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                            ),
                          ),
                          Text(
                            calcSubString.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      children: [
                        GestureDetector(
                          onTap: () => _getString('7'),
                          child: NumBtn(
                            string: '7',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('8'),
                          child: NumBtn(
                            string: '8',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('9'),
                          child: NumBtn(
                            string: '9',
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => _calcFunc('DEL'),
                          child: NumBtn(
                            string: 'DEL',
                            color: const Color(0xff3a4764),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => _getString('4'),
                          child: NumBtn(
                            string: '4',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('5'),
                          child: NumBtn(
                            string: '5',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('6'),
                          child: NumBtn(
                            string: '6',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {_additionFunc('+'), _getString('+')},
                          child: NumBtn(
                            string: '+',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => _getString('1'),
                          child: NumBtn(
                            string: '1',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('2'),
                          child: NumBtn(
                            string: '2',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('3'),
                          child: NumBtn(
                            string: '3',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {_subtractionFunc('-'), _getString('-')},
                          child: NumBtn(
                            string: '-',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          // onTap: () => _calcFunc('.'),
                          child: NumBtn(
                            string: '.',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _getString('0'),
                          child: NumBtn(
                            string: '0',
                          ),
                        ),
                        GestureDetector(
                          //  onTap: () => _calcFunc('/'),
                          child: NumBtn(
                            string: '/',
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              {_multiplicatonFunc('x'), _getString('x')},
                          child: NumBtn(
                            string: 'x',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => _resetFunc(),
                          child: NumBtn(
                            string: 'RESET',
                            widthFactor: 2,
                            color: const Color(0xff3a4764),
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => _calcFunc('='),
                          child: NumBtn(
                            string: '=',
                            widthFactor: 2,
                            color: Colors.redAccent,
                          ),
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
  NumBtn(
      {Key? key,
      required this.string,
      this.color = Colors.white,
      this.widthFactor = 1})
      : super(key: key);

  final double widthFactor;
  final Color color;
  final String string;

  var tempNum = ''.obs;

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
