import 'package:flutter/material.dart';
import 'package:hotels_app/hotel_api.dart';
import 'package:hotels_app/screen_pages/hotel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final hotelApi = HotelApi();
  List<String> images = [
    'assets/images/image 20.png',
    'assets/images/image 20.png',
    'assets/images/image 20.png',
    'assets/images/image 20.png',
    'assets/images/image 20.png',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width * 0.05;
    double imageWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      body: FutureBuilder(
        future: hotelApi.fetchHotelData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Ошибка: ${snapshot.error}');
          } else {
            var hotelData = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('Отель', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                                child: Container(
                                  width: imageWidth,
                                  height: MediaQuery.of(context).size.height * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      PageView.builder(
                                          itemCount: hotelData['image_urls'].length,
                                          onPageChanged: (int page) {
                                            setState(() {
                                              currentPage = page;
                                            });
                                          },
                                          itemBuilder: (BuildContext context, int index) {
                                            return Image.network(hotelData['image_urls'][index], fit: BoxFit.cover);
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
                                              List.generate(hotelData['image_urls'].length, (index) => _buildDot(index, context)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.37,
                                      height: MediaQuery.of(context).size.height * 0.04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFFFC700).withOpacity(0.2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.star, color: Color(0xFFFFC800), size: 15),
                                          Text(' ${hotelData['rating']} ${hotelData['rating_name']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFC800)))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text('Steigenberger Makadi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.zero,
                                        foregroundColor: Colors.blue,
                                      ),

                                      onPressed: () {},
                                      child: Text('${hotelData['adress']}'),
                                    ),
                                    Row(
                                      children: [
                                        Text('от ${hotelData['minimal_price']} ₽ ', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                                        Text('${hotelData['price_for_it']}')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: sidePadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Об отеле', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xFFFBFBFC),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${hotelData['about_the_hotel']['peculiarities'][0]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796))),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xFFFBFBFC),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${hotelData['about_the_hotel']['peculiarities'][2]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796))),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width * 0.48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFFBFBFC),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${hotelData['about_the_hotel']['peculiarities'][3]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796))),
                                      )),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width * 0.37,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFFBFBFC),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${hotelData['about_the_hotel']['peculiarities'][1]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828796))),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('${hotelData['about_the_hotel']['description']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFFBFBFC),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _buildInfoContainer('assets/images/emoji-happy.png', 'Удобства', 'Самое необходимое'),
                                      const SizedBox(height: 10),
                                      _dash(),
                                      const SizedBox(height: 10),
                                      _buildInfoContainer('assets/images/tick-square.png', 'Что включено', 'Самое необходимое'),
                                      const SizedBox(height: 10),
                                      _dash(),
                                      const SizedBox(height: 10),
                                      _buildInfoContainer('assets/images/close-square.png', 'Что не включено', 'Самое необходимое'),
                                    ],
                                  ),
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
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HotelPage()));
                                },
                                child: const Text('К выбору номера', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoContainer(String assetName, String title, String subtitle) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.83,
      height: MediaQuery.of(context).size.height * 0.065,
      child: Row(
        children: [
          Image.asset(assetName),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF828796))),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }

  Widget _dash() {
    return Padding(
      padding: const EdgeInsets.only(left: 44),
      child: Container(
        // width: 256,
        width: MediaQuery.of(context).size.width * 0.7,
        height: 1,
        color: const Color(0xFF828796).withOpacity(0.15),
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