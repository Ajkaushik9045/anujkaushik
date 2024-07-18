import 'package:anujkaushik/components/constants/color.dart';
import 'package:anujkaushik/pages/branch_bottomSheet.dart';
import 'package:anujkaushik/pages/branch_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedBranch = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedBranch.isNotEmpty) {
          setState(() {
            selectedBranch = '';
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: selectedBranch.isEmpty
            ? AppBar(
                backgroundColor: AppColors.primaryColor,
                title: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find your own way',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Search in 600 colleges around!',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: AppColors.secondaryColor,
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                ],
              )
            : null,
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: selectedBranch.isEmpty
                  ? _buildInitialContent()
                  : _buildBranchContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(18.0),
          bottomRight: Radius.circular(18.0),
        ),
      ),
      height: 140,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Colleges Schools...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: IconButton(
              icon: const Icon(Icons.mic),
              color: AppColors.secondaryBlackColor,
              onPressed: () {
                // Handle mic button press
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialContent() {
    return ListView(
      children: [
        _buildImageWithText(
          imagePath: 'assets/images/Colleges.png',
          text: 'Top Colleges',
          desc: 'Search through thousands of\n accredited colleges and universities\n online to find the right one for you.\nApply in 3 min, and connect with your\n future.',
          bottomText: '+126 Colleges',
          onTap: () {
            _showBranchBottomSheet('Branch 1');
          },
        ),
        _buildImageWithText(
          imagePath: 'assets/images/Schools.png',
          text: 'Top Schools',
          desc: 'Searching for the best school for you \njust got easier! With our Advanced \nSchool Search, you can easily filter out \nthe schools that are fit for you.',
          bottomText: '+106 Schools',
          onTap: () {
            _showBranchBottomSheet('Branch 2');
          },
        ),
        _buildImageWithText(
          imagePath: 'assets/images/Exams.png',
          text: 'Exams',
          desc: 'Find an end to end information about \nthe exams that are happening in India',
          bottomText: '+16 Exams',
          onTap: () {
            _showBranchBottomSheet('Branch 3');
          },
        ),
      ],
    );
  }

  Widget _buildBranchContent() {
    return BranchContent(selectedBranch: selectedBranch);
  }

  Widget _buildImageWithText({
    required String imagePath,
    required String text,
    required String desc,
    required String bottomText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: 300,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 2,
                right: 1,
                child: Text(
                  bottomText,
                  style: const TextStyle(
                    color: AppColors.secondaryBlackColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 0),
                        blurRadius: 10.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 10.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      desc,
                      
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBranchBottomSheet(String branch) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BranchBottomSheet(
          selectedBranch: selectedBranch,
          onSelectBranch: (selectedBranch) {
            setState(() {
              this.selectedBranch = selectedBranch;
            });
          },
        );
      },
    );
  }
}
