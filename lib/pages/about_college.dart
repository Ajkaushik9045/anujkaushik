import 'package:flutter/material.dart';

class AboutCollege extends StatelessWidget {
  const AboutCollege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNeque accumsan, scelerisque eget lectus ullamcorper a\nplacerat. Porta cras at pretium varius purus cursus. Morbi\njusto commodo habitant morbi quis pharetra posuere mauris.\nMorbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices",
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 15),
            const Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/location.png"),
            const SizedBox(height: 15),
            const Text(
              "Students Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/Boypic.png"),
                Image.asset("assets/images/Girlpic1.png"),
                Image.asset("assets/images/Girlpic2.png"),
                Image.asset("assets/images/Girlpic3.png"),
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "+12",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Image.asset("assets/images/arrowUpward.png"),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 300,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Arun Sai",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Nec sed lorem nunc varius rutrum eget dolor, quis. Nulla\n sit magna suscipit tellus malesuada in facilisis a.",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          Icon(Icons.star_half, color: Colors.yellow, size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
