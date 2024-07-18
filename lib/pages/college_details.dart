import 'package:anujkaushik/components/constants/color.dart';
import 'package:anujkaushik/pages/about_college.dart';
import 'package:anujkaushik/pages/hostel_facility.dart';
import 'package:flutter/material.dart';

class CollegeDetails extends StatefulWidget {
  const CollegeDetails({super.key});

  @override
  CollegeDetailsState createState() => CollegeDetailsState();
}

class CollegeDetailsState extends State<CollegeDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarTitle = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_showAppBarTitle) {
      setState(() {
        _showAppBarTitle = true;
      });
    } else if (_scrollController.offset <= 50 && _showAppBarTitle) {
      setState(() {
        _showAppBarTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: _showAppBarTitle
            ? const Text(
                "GHJK Engineering College",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor),
              )
            : null,
        leading: _showAppBarTitle
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryColor,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
              ),
        actions: _showAppBarTitle
            ? []
            : [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    child: IconButton(
                      onPressed: () {
                        // Handle bookmark icon press
                      },
                      icon: const Icon(Icons.bookmark_outline,
                          color: AppColors.secondaryBlackColor),
                    ),
                  ),
                )
              ],
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/CoolegeImage.png",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "GHJK Engineering College",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nFelis consectetur nulla pharetra praesent hendrerit\nvulputate viverra. Pellentesque aliquam tempus faucibus est.",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "4.3",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.secondaryColor),
                              ),
                              Icon(Icons.star, color: AppColors.secondaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Material(
              elevation: 2,
              color: AppColors.secondaryColor,
              child: TabBar(
                controller: _tabController,
                labelStyle:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "About Us",
                  ),
                  Tab(text: "Hostel Facility"),
                  Tab(text: "Events"),
                  Tab(text: "Q & A"),
                ],
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.secondaryBlackColor,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AboutCollege(),
                  HostelFacility(),
                  Center(child: Text("Events Content")),
                  Center(child: Text("Q & A Content")),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withOpacity(0.9),
                spreadRadius: 4,
                blurRadius: 12,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              // Add your button onPressed logic here
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Apply Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
