import 'package:anujkaushik/components/constants/color.dart';
import 'package:flutter/material.dart';

class HostelFacility extends StatefulWidget {
  const HostelFacility({super.key});

  @override
  _HostelFacilityState createState() => _HostelFacilityState();
}

class _HostelFacilityState extends State<HostelFacility> {
  final PageController _pageController = PageController();
  final int _currentPage = 0;
  final List<String> _images = [
    "assets/images/room1.png",
    "assets/images/room2.png",
    "assets/images/room2.png"
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRoomOption(4),
                  const SizedBox(width: 5),
                  _buildRoomOption(3),
                  const SizedBox(width: 5),
                  _buildRoomOption(2),
                  const SizedBox(width: 5),
                  _buildRoomOption(1),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 25),
                child: Row(
                  children: _images.map((image) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(image, width: 130, height: 105),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 8.0,
                  width: _currentPage == index ? 8.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "GHJK Engineering Hostel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "4.3",
                          style: TextStyle(color: AppColors.secondaryColor),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0, top: 12),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur ",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Neque accumsan, scelerisque eget lectus ullamcorper a \nplacerat. Porta cras at pretium varius purus cursus. Morbi\n justo commodo habitant morbi quis pharetra posuere\n mauris. Morbi sit risus, diam amet volutpat quis. Nisl\n pellentesque nec facilisis ultrices.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  "Facilities",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.business, color: Colors.red),
                      SizedBox(width: 10),
                      Text("College in 400 meter"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.bathroom, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Bathrooms: 2"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomOption(int roomCount) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.bed, color: AppColors.primaryColor),
          Text("$roomCount", style: const TextStyle(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
