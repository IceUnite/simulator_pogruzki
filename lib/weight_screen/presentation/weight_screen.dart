import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simulator_pogruzki/razgruz_screen/presentation/razgruz_screen.dart';
import 'package:simulator_pogruzki/global_variables/global_variables.dart'
    as globals;

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

Future<int> func() async {
  late int weight;
  await globals.reader.stream.read((data) {
    var decoded = ascii.decode(data).toString();
    weight = data;
  });
  return weight;
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

bool? isTrue = null;
String str = "${{"cmd": "weighten", "args": []}}";
final List<int> codeUnits = str.codeUnits;
final Uint8List unit8List = Uint8List.fromList(codeUnits);

class _WeightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    double weight = 18880;
    return Scaffold(
      backgroundColor: const Color(0xFF2C4D8C),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 23, bottom: 39, left: 22),
            width: 300,
            height: 962,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF002863),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 34,
                ),
                SizedBox(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeightScreen()),
                          );
                        },
                        child: const Text('Измерить вес'))),
                const SizedBox(
                  height: 26,
                ),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                      style: globals.weight == null
                          ? ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey))
                          : globals.weight > 800
                              ? ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey))
                              : null,
                      onPressed: () {
                        if (globals.weight != null && globals.weight < 800) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RazgruzScreen()),
                          );
                          QuickAlert.show(
                              title: "Внимание!",
                              text:
                                  "Покиньте автомобиль и нажмите на кнопку снизу",
                              context: context,
                              confirmBtnText: "Я покинул автомобиль",
                              type: QuickAlertType.warning,
                              onConfirmBtnTap: () {
                                globals.isFallDown = true;
                                globals.isBegin = true;
                                Navigator.pop(context);
                              });
                        }
                      },
                      child: const Text('Разгрузить сырье')),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 23,
              bottom: 39,
              left: 34,
              right: 34,
            ),
            width: 1032,
            height: 962,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF002863),
            ),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                    width: 410,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 320,
                        ),
                        const Text(
                          "Максимально допустимый вес:",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Container(
                            width: 295,
                            height: 48,
                            decoration: BoxDecoration(
                                color: const Color(0xFF336BD7),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                                child: Text(
                              '1000 грамм',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ))),
                        const SizedBox(
                          height: 33,
                        ),
                        SizedBox(
                          width: 240,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              SerialPort(globals.portName).write(unit8List);
                              globals.weight = 320;
                              if (globals.weight < 1000) {
                                isTrue = true;
                              } else {
                                isTrue = false;
                              }
                              setState(() {});
                            },
                            child: const Text(
                              'Измерить вес',
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 128,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 260,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          globals.weight != null
                              ? Text(
                                  '${globals.weight} ',
                                  style: TextStyle(
                                      color: globals.weight < 1000
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w800),
                                )
                              : const SizedBox(
                                  width: 200,
                                ),
                          const Text(
                            'Грамм',
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          )
                        ],
                      ),
                      const Center(
                        child: Text('Фактический вес',
                            style:
                                TextStyle(color: Colors.white, fontSize: 36)),
                      )
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 100,
                ),
                (isTrue != null)
                    ? SizedBox(
                        child: (isTrue != null)
                            ? (globals.weight < 800)
                                ? const Text(
                                    'Масса груза замерена, проверка веса пройдена',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.green),
                                  )
                                : const Text(
                                    'Масса груза замерена, проверка веса не пройдена',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red),
                                  )
                            : null)
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
