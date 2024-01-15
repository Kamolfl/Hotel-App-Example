import 'package:flutter/material.dart';
import 'package:hotels_app/screen_pages/booking_page.dart';
import 'package:hotels_app/widgets/custom_button.dart';

import '../services/hotel_api.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final hotelApi = HotelApi();
  Future? _hotelPageDataFuture;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _hotelPageDataFuture = hotelApi.fetchHotelPageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F9),
        body: FutureBuilder(
          future: _hotelPageDataFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator  ());
            } else if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            } else {
              var hotelNumberData = snapshot.data;
              return Column(
                children: [
                  _myAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _blockWithTheNumber1(hotelNumberData),
                          _blockWithTheNumber2(hotelNumberData),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        )
    );
  }

  Widget _myAppBar() {
    return SafeArea(
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
    );
  }

  Widget _blockWithTheNumber1(Map<String, dynamic> hotelNumberData) {
    double sidePadding = MediaQuery.of(context).size.width * 0.05;
    double imageWidth = MediaQuery.of(context).size.width * 0.9;
    return Column(
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
                    color: Colors.blueGrey,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                          itemCount: hotelNumberData['rooms'][0]['image_urls'].length,
                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  hotelNumberData['rooms'][0]['image_urls'][index],
                                  key: UniqueKey(),
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                                    }
                                  },
                                ));
                          }),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              List.generate(hotelNumberData['rooms'][0]['image_urls'].length, (index) => _buildDot(index, context)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text('${hotelNumberData['rooms'][0]['name']}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start  ,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFBFBFC),
                        ),
                        child: Center(child: Text('${hotelNumberData['rooms'][0]['peculiarities'][0]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFBFBFC),
                        ),
                        child: Center(child: Text('${hotelNumberData['rooms'][0]['peculiarities'][1]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 29,
                    // width: 200,
                    width: MediaQuery.of(context).size.width * 0.58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF0D72FF).withOpacity(0.1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Подробнее о номере', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0D72FF))),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF0D72FF))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('${hotelNumberData['rooms'][0]['price']} ₽ ', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                    Text('${hotelNumberData['rooms'][0]['price_per']}', style: const TextStyle(color: Color(0xFF828796)))
                  ],
                ),
                CustomButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingPage()));
                }, text: 'Выбрать номер'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _blockWithTheNumber2(Map<String, dynamic> hotelNumberData) {
    double sidePadding = MediaQuery.of(context).size.width * 0.05;
    double imageWidth = MediaQuery.of(context).size.width * 0.9;
    return Column(
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
                          itemCount: hotelNumberData['rooms'][1]['image_urls'].length,
                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  hotelNumberData['rooms'][1]['image_urls'][index],
                                  key: UniqueKey(),
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ));
                          }),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              List.generate(hotelNumberData['rooms'][1]['image_urls'].length, (index) => _buildDot(index, context)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text('${hotelNumberData['rooms'][1]['name']}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start  ,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFBFBFC),
                        ),
                        child: Center(child: Text('${hotelNumberData['rooms'][1]['peculiarities'][0]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFBFBFC),
                        ),
                        child: Center(child: Text('${hotelNumberData['rooms'][1]['peculiarities'][1]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.54,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFBFBFC),
                        ),
                        child: Center(child: Text('${hotelNumberData['rooms'][1]['peculiarities'][2]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796)))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 29,
                    // width: 200,
                    width: MediaQuery.of(context).size.width * 0.58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF0D72FF).withOpacity(0.1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Подробнее о номере', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0D72FF))),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF0D72FF))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('${hotelNumberData['rooms'][1]['price']} ₽ ', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                    Text('${hotelNumberData['rooms'][1]['price_per']}', style: const TextStyle(color: Color(0xFF828796)))
                  ],
                ),
                CustomButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingPage()));
                }, text: 'Выбрать номер'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
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
