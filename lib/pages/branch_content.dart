

import 'package:anujkaushik/components/constants/color.dart';
import 'package:anujkaushik/pages/college_details.dart';
import 'package:flutter/material.dart';

class BranchContent extends StatelessWidget {
  final String selectedBranch;

  const BranchContent({
    super.key,
    required this.selectedBranch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.secondaryColor),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildCollegeCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCollegeCard(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCollegeImage(),
          const SizedBox(height: 10),
          _buildCollegeDetails(context),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildCollegeImage() {
    return Image.asset(
      "assets/images/realcollege.png",
      width: double.infinity,
      height: 100,
    );
  }

  Widget _buildCollegeDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "GHJK Engineering College",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            _buildRating(),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Eu ut imperdiet sed nec ullamcorper.",
                style: TextStyle(fontSize: 6),
              ),
            ),
            _buildApplyNowButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildRating() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 45,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "4.3",
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 14),
            ),
            Icon(
              Icons.star,
              size: 15,
              color: AppColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplyNowButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CollegeDetails(),
            ),
          );
        },
        child: Container(
          width: 65,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 13, 48, 76),
          ),
          child: const Center(
            child: Text(
              "Apply Now",
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.thumb_up,
            size: 15,
            color: Colors.blue,
          ),
          SizedBox(width: 4),
          Text(
            "More than 1000+ students have been placed",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          Spacer(),
          Icon(
            Icons.remove_red_eye_outlined,
            size: 15,
            color: Colors.grey,
          ),
          SizedBox(width: 3),
          Text(
            "468+",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
