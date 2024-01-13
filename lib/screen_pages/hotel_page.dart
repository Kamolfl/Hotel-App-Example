import 'package:flutter/material.dart';
import 'package:hotels_app/screen_pages/booking_page.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  List<String> images = [
    'assets/images/image 20.png',
    'assets/images/image 21.png',
    'assets/images/image 20.png',
    'assets/images/image 21.png',
    'assets/images/image 20.png',
  ];

  List<String> images1 = [
    'assets/images/image 21.png',
    'assets/images/image 20.png',
    'assets/images/image 21.png',
    'assets/images/image 20.png',
    'assets/images/image 21.png',
    'assets/images/image 20.png',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width * 0.05;
    double imageWidth = MediaQuery.of(context).size.width * 0.9;
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
                    'Steigenberger Makadi',
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Container(
                            width: imageWidth,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                PageView.builder(
                                    itemCount: images.length,
                                    onPageChanged: (int page) {
                                      setState(() {
                                        currentPage = page;
                                      });
                                    },
                                    itemBuilder: (BuildContext context, int index) {
                                      return Image.asset(images[index], fit: BoxFit.fill);
                                    }),
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:
                                        List.generate(images.length, (index) => _buildDot(index, context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Стандартный с видом на бассейн или сад', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 29,
                                width: 123,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFFBFBFC),
                                ),
                                child: const Center(child: Text('Все включено', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 29,
                                width: 121,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFFBFBFC),
                                ),
                                child: const Center(child: Text('Кондиционер', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 29,
                              width: 200  ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF0D72FF).withOpacity(0.1),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Подробнее о номере', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0D72FF))),
                                  Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF0D72FF),)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text('186 600 ₽ ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                              Text('за 7 ночей с перелётом', style: TextStyle(color: Color(0xFF828796)))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
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
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingPage()));
                                      },
                                      child: const Text('Выбрать номер', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Container(
                            width: imageWidth,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                PageView.builder(
                                    itemCount: images1.length,
                                    onPageChanged: (int page) {
                                      setState(() {
                                        currentPage = page;
                                      });
                                    },
                                    itemBuilder: (BuildContext context, int index) {
                                      return Image.asset(images1[index], fit: BoxFit.fill);
                                    }),
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:
                                        List.generate(images1.length, (index) => _buildDot(index, context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Стандартный с видом на бассейн или на море', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 29,
                                width: 123,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFFBFBFC),
                                ),
                                child: const Center(child: Text('Все включено', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 29,
                                width: 121,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFFBFBFC),
                                ),
                                child: const Center(child: Text('Кондиционер', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 29,
                              width: 200  ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF0D72FF).withOpacity(0.1),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Подробнее о номере', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0D72FF))),
                                  Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF0D72FF),)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text('189 600 ₽ ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                              Text('за 7 ночей с перелётом', style: TextStyle(color: Color(0xFF828796)))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size.fromHeight(50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text('Выбрать номер', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
