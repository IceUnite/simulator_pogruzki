import 'package:flutter/material.dart';
import 'package:simulator_pogruzki/razgruz_screen/presentation/razgruz_screen.dart';

class WeightScreen extends StatefulWidget {
  WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

bool isTrue = false;

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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RazgruzScreen()),
                        );
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
                              if (weight < 1000) {
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
                          Text(
                            '${weight}',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 70,
                                fontWeight: FontWeight.w800),
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
                (isTrue == false)
                    ? const Text(
                        'Масса груза замерена, проверка веса не пройдена',
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      )
                    : const Text(
                        'Масса груза замерена, проверка веса пройдена',
                        style: TextStyle(fontSize: 30, color: Colors.green),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
