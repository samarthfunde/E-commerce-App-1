import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_commerece_app_1/custom_widgets/custom_item_widget.dart';
import 'package:e_commerece_app_1/utils/app_colors.dart';
import 'package:e_commerece_app_1/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgUrls = [
    'lib/assets/images/banner_1.png',
    'lib/assets/images/banner_2.png',
    'lib/assets/images/banner_3.png',
  ];
  CarouselSliderController _carouselController =
      CarouselSliderController(); // Updated controller type
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              mAppBar(),
              heightSpacing(),
              searchBar(),
              heightSpacing(),
              bannerSlider(),
              heightSpacing(),
              Expanded(
                child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                    childAspectRatio: 7 / 8,
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductItemUI();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.WhitColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: Icon(Icons.home_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 11,
        shadowColor: AppColors.primaryColor,
        surfaceTintColor: Colors.white,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  Widget bannerSlider() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 700),
                enlargeCenterPage: true,
                viewportFraction: 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: imgUrls.map((eachUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: Image.asset(
                    eachUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 10, // Position at the bottom of the slider
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: imgUrls.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey.withOpacity(0.6),
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 2,
                  spacing: 8,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mAppBar() {
    return AppBar(
      backgroundColor: Colors.pink, // Set AppBar background color to pink
      //elevation: 0, // Flat AppBar without shadow

      title: Text(
        "E-COMMERCE", // Title text
        style: TextStyle(
          color: Colors.white, // Title text color
          fontSize: 20, // Font size
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),

      centerTitle: true, // Center the title text
      actions: [
        // Add notification icon on the right
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors
                  .white, // Light grey background for the notification icon
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.pink),
              onPressed: () {
                // Add functionality here for notifications
              },
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Light grey background for the menu icon
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.pink),
            onPressed: () {
              // Add functionality here for menu
            },
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.lightGreyColor),
      child: Row(
        children: [
          widthSpacing(),
          Icon(Icons.search, color: AppColors.greyColor),
          Expanded(
              child: TextField(
            maxLines: 1,
            cursorHeight: 16,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 0,
                color: Colors.transparent,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 0,
                color: Colors.transparent,
              )),
            ),
          )),
          widthSpacing(),
          Container(
            width: 1,
            height: 10,
            color: AppColors.greyColor,
          ),
          widthSpacing(),
          Icon(Icons.menu_open, color: AppColors.greyColor),
          widthSpacing(),
        ],
      ),
    );
  }
}
