import 'package:flutter/material.dart';
import 'package:simulator_pogruzki/razgruz_screen/presentation/razgruz_screen.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            MaterialPageRoute(builder: (context) => const WeightScreen()),
                          );
                        }, child: const Text('Измерить вес'))),
                const SizedBox(
                  height: 26,
                ),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RazgruzScreen()),
                        );
                      }, child: const Text('Разгрузить сырье')),
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
            child: Row(children: [
              SizedBox(
                width: 410,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
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
                          color: Color(0xFF336BD7),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(child: Text('1000 грамм', style: TextStyle(fontSize: 20, color: Colors.white),))
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    SizedBox(
                      width: 240,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //    MaterialPageRoute(builder: (context) => const MainScreen()),
                          // );
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
              SizedBox(width: 128,),
              Column(
                children: [
                  SizedBox(
                    height: 260,
                  ),
                  Row( crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('100.0', style: TextStyle(color: Colors.red, fontSize: 150, fontWeight: FontWeight.w800),),
                      Text('Грамм', style: TextStyle(color: Colors.white, fontSize: 28),)],
                  ),
                  Center(child: Text('Фактический вес', style: TextStyle(color: Colors.white, fontSize: 36)),)
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
