import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:simulator_pogruzki/global_variables/global_variables.dart'
    as globals;

enum Bort { backBort, leftBort }

enum Gradus { one, two, three, fouth, five }


class RazgruzScreen extends StatefulWidget {
  const RazgruzScreen({Key? key}) : super(key: key);

  @override
  State<RazgruzScreen> createState() => _RazgruzScreenState();

}

bool? isFinish = false;

String str = "${{"cmd": "loadout"}}\n";
final List<int> codeUnits = str.codeUnits;
final Uint8List unit8List = Uint8List.fromList(codeUnits);

Future<void> func() async {
  // late var weight;
  await globals.reader.stream.read((data) {
    var decoded = ascii.decode(data).toString();
    // weight = decoded;
  });
}

class _RazgruzScreenState extends State<RazgruzScreen> {

  @override
  bool isFinish = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C4D8C),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //   Container(
        //     margin: const EdgeInsets.only(top: 23, bottom: 39, left: 22),
        //     width: 300,
        //     height: 962,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: const Color(0xFF002863),
        //     ),
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 34,
        //         ),
        //         SizedBox(
        //           width: 240,
        //           height: 50,
        //           child: ElevatedButton(
        //             onPressed: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => const WeightScreen()),
        //               );
        //             },
        //             child: const Text('Измерить вес'),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 26,
        //         ),
        //         SizedBox(
        //           width: 240,
        //           height: 50,
        //           child: ElevatedButton(
        //               style: globals.weight == null
        //                   ? ButtonStyle(
        //                       backgroundColor:
        //                           MaterialStateProperty.all(Colors.grey))
        //                   : globals.weight > 800
        //                       ? ButtonStyle(
        //                           backgroundColor:
        //                               MaterialStateProperty.all(Colors.grey))
        //                       : null,
        //               onPressed: () {
        //                 if (globals.weight != null && globals.weight < 800) {
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => const RazgruzScreen()),
        //                   );
        //                   QuickAlert.show(
        //                       title: "Внимание!",
        //                       text:
        //                           "Покиньте автомобиль и нажмите на кнопку снизу",
        //                       context: context,
        //                       confirmBtnText: "Я покинул автомобиль",
        //                       type: QuickAlertType.warning,
        //                       onConfirmBtnTap: () {
        //                         globals.isFallDown = true;
        //                         globals.isBegin = true;
        //                         Navigator.pop(context);
        //                       });
        //                 }
        //               },
        //               child: const Text('Разгрузить сырье')),
        //         ),
        //       ],
        //     ),
        //   ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 33, left: 33),
                            child: Text(
                              'Платформа №1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          // SizedBox(
                          //   width: 500,
                            // child: Row(
                            //   children: [
                            //     SizedBox(
                            //         width: 250,
                            //         height: 21,
                            //         child: RadioListTile(
                            //             activeColor: Colors.white,
                            //             dense: true,
                            //             value: Bort.leftBort,
                            //             groupValue: _Bort,
                            //             title: const Text(
                            //               'Через боковой борт',
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontSize: 16),
                            //             ),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 _Bort = val;
                            //               });
                            //             })),
                            //     SizedBox(
                            //         width: 250,
                            //         height: 21,
                            //         child: RadioListTile(
                            //             activeColor: Colors.white,
                            //             dense: true,
                            //             value: Bort.backBort,
                            //             groupValue: _Bort,
                            //             title: const Text(
                            //               'Через задний борт',
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontSize: 16),
                            //             ),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 _Bort = val;
                            //               });
                            //             })),
                            //   ],
                            // ),
                          // ),
                          const Padding(
                            padding: EdgeInsets.only(left: 33, top: 33),
                            child: Text(
                              'Описание выгрузки:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 33, top: 33),
                            child: Text(
                              'Тип выгрузки: через задний борт \nУгол наклона: 40°',
                              style:
                              TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //     width: 120,
                                //     height: 21,
                                //     child: RadioListTile(
                                //         activeColor: Colors.white,
                                //         dense: true,
                                //         value: Gradus.one,
                                //         groupValue: _Gradus,
                                //         title: const Text(
                                //           '14°',
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16),
                                //         ),
                                //         onChanged: (val) {
                                //           setState(() {
                                //             _Gradus = val;
                                //           });
                                //         })),
                                // SizedBox(
                                //     width: 120,
                                //     height: 21,
                                //     child: RadioListTile(
                                //         activeColor: Colors.white,
                                //         dense: true,
                                //         value: Gradus.two,
                                //         groupValue: _Gradus,
                                //         title: const Text(
                                //           '20°',
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16),
                                //         ),
                                //         onChanged: (val) {
                                //           setState(() {
                                //             _Gradus = val;
                                //           });
                                //         })),
                                // SizedBox(
                                //     width: 120,
                                //     height: 21,
                                //     child: RadioListTile(
                                //         activeColor: Colors.white,
                                //         dense: true,
                                //         value: Gradus.three,
                                //         groupValue: _Gradus,
                                //         title: const Text(
                                //           '26°',
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16),
                                //         ),
                                //         onChanged: (val) {
                                //           setState(() {
                                //             _Gradus = val;
                                //           });
                                //         })),
                                // SizedBox(
                                //     width: 120,
                                //     height: 21,
                                //     child: RadioListTile(
                                //         activeColor: Colors.white,
                                //         dense: true,
                                //         value: Gradus.fouth,
                                //         groupValue: _Gradus,
                                //         title: const Text(
                                //           '32°',
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16),
                                //         ),
                                //         onChanged: (val) {
                                //           setState(() {
                                //             _Gradus = val;
                                //           });
                                //         })),
                                // SizedBox(
                                //     width: 120,
                                //     height: 21,
                                //     child: RadioListTile(
                                //         activeColor: Colors.white,
                                //         dense: true,
                                //         value: Gradus.five,
                                //         groupValue: _Gradus,
                                //         title: const Text(
                                //           '38°',
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16),
                                //         ),
                                //         onChanged: (val) {
                                //           setState(() {
                                //             _Gradus = val;
                                //           });
                                //         })),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          isFinish == false
                              ? Padding(
                            padding: const EdgeInsets.only(left: 200, bottom: 30),
                            child: SizedBox(
                                width: 240,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                 backgroundColor: globals.isBegin == false
                                     ? const MaterialStatePropertyAll(Colors.grey)
                                     : null
                                  ),
                                    onPressed: () {
                                      SerialPort(globals.portName).write(unit8List);
                                      func();
                                      setState(() {
                                        //TODO запись в буфер и отправка команды на разгрузку
                                        //TODO ожидание ответа об окончани разгрузки
                                        isFinish = true;
                                      });
                                    },
                                    child: const Text('Начать разгрузку'))),
                          )
                         : Padding(
                           padding: const EdgeInsets.only(left:200, bottom: 30),
                           child: SizedBox(
                              width: 240,
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: globals.isBegin == false
                                          ? const MaterialStatePropertyAll(Colors.grey)
                                          : null
                                  ),
                                  onPressed: () {
                                    isFinish = false;
                                    setState(() {

                                    });
                                  },
                                  child: const Text('Опустить платформу')),
                            ),
                         ),
                        ],
                      )
                    ],
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset(
                      'assets/images/gruz.png',
                      width: 578,
                      height: 350,
                    ),
                  ))
                ],
              )),
        ],
      ),
    );
  }
}
