import 'package:flutter/material.dart';
import 'package:hotels_app/screen_pages/paid_for_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
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
                    'Бронирование',
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.029,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFC700).withOpacity(0.2),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFFFFC800), size: 15),
                                Text(' 5 Превосходно', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFC800)))
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Steigenberger Makadi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          TextButton(
                            onPressed: () {}, child: const Text('Madinat Makadi, Safaga Road, Makadi Bay, Египет'),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              foregroundColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1, // занимает 1 "часть" горизонтального пространства
                                child: Text('Вылет из', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2, // занимает 2 "части" горизонтального пространства, делая вторую колонку шире, если это желаемо
                                child: Text('Санкт-Петербург', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Страна, город', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 20),
                              Expanded(child: Text('Египет, Хургада', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text('Даты', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: Text('19.09.2023 – 27.09.2023', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text('Кол-во ночей', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: Text('7 ночей', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text('Отель', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: Text('Steigenberger Makadi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text('Номер', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: Text('Стандартный с видом на бассейн или сад', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text('Питание', style: TextStyle(color: Color(0x7F828796), fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: Text('Все включено', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          const Text('Информация о покупателе', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Номер телефона', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                  Text('+7 (951) 555-99-00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Почта', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                  Text('examplemail.000@mail.ru', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF828796))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.67,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Первый турист', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                              Padding(
                                padding: const EdgeInsets.only(right: 7.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0D72FF).withOpacity(0.1),
                                  ),
                                  child: Image.asset('assets/images/Vector 55.png'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Имя', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                  Text('Иван', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Фамилия', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                  Text('Иванов', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Дата рождения', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Гражданство', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Номер загранпаспорта', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF6F6F9),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Срок действия загранпаспорта', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFFA9ABB7))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Второй турист', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF0D72FF).withOpacity(0.1),
                              ),
                              child: Image.asset('assets/images/Vector 56.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Добавить туриста', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF0D72FF),
                                ),
                                child: const Icon(Icons.add, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Тур', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF828796))),
                              Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text('186 600 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Топливный сбор', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF828796))),
                              Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text('9 300 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Сервисный сбор', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF828796))),
                              Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text('2 136 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('К оплате', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF828796))),
                              Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text('198 036 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
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
                          child: const Text('Оплатить 198 036 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
