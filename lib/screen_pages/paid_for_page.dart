import 'package:flutter/material.dart';

class PaidForPage extends StatefulWidget {
  const PaidForPage({super.key});

  @override
  State<PaidForPage> createState() => _PaidForPageState();
}

class _PaidForPageState extends State<PaidForPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                  const Text(
                    'Заказ оплачен',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: CircleAvatar(
                    radius: 47,
                    child: Image.asset('assets/images/Frame 610.png'),
                  ),
                ),
                Text('Ваш заказ принят в работу', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaidForPage()));
                          },
                          child: const Text('Супер!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
