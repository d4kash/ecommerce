import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liftu_ecommerce/constants/constant.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  final int index;
  const ProductDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: 'productDetails$index',
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Text(
                          'Details',
                          style: TextStyle(
                              fontSize: Constant.height / 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.favorite_border_outlined),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: Constant.height / 2.5,
                  width: Constant.width,
                  child: CustomCarosel(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Galaxy Watch 7',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Constant.height / 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$ 999',
                        style: TextStyle(
                            fontSize: Constant.height / 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: Constant.height / 20),
                ColorChoices(),
                SizedBox(height: Constant.height / 50),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(  backgroundColor: Colors.black,
            // padding: EdgeInsets.symmetric(horizontal: 10),
                   shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                //borderRadius: BorderRadius.zero, //Rectangular border
              ),
                  minimumSize: const Size.fromHeight(50),),
             child: Text('Buy now',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,fontSize: Constant.width/20),)),
          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorChoices extends StatelessWidget {
  ColorChoices({super.key});
  final RxInt selectedColor = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Colors Available',
            style: TextStyle(
                fontSize: Constant.height / 35,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Container(
          height: Constant.height / 8,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => selectedColor.value = index,
                  child: Obx(() => Container(
                        margin: const EdgeInsets.all(8),
                        // height: Constant.height/2,
                        width: Constant.width / 5,
                        decoration: BoxDecoration(
                            border: Border.all(color: selectedColor.value==index?Colors.black:Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        child: Card(
                          child: Image.network(
                              'https://api.lorem.space/image/fashion?w=640&h=480&r=4278',
                              fit: BoxFit.cover),
                        ),
                      )),
                );
              }),
        )
      ],
    );
  }
}

class CustomCarosel extends StatelessWidget {
  CustomCarosel({Key? key}) : super(key: key);
  final RxInt activeCauroselPage = 0.obs;
  final PageController _pageController =
      PageController(initialPage: 100, viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.height / 3.5,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 400.0,
            viewportFraction: 1.0,
            scrollDirection: Axis.vertical,
            autoPlay: true,
            onPageChanged: (value, reason) => activeCauroselPage.value = value),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: Constant.width,
                  height: Constant.height,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Stack(
                    children: [
                      Text('data'),
                      _buildMidContainerWithImage(),
                      Positioned(
                          top: 150,
                          left: -Constant.width / 1.4,
                          right: 0,
                          height: 200,
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                  5,
                                  (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 6),
                                        child: InkWell(
                                          onTap: () {
                                            _pageController.animateToPage(index,
                                                duration: const Duration(
                                                    milliseconds: 350),
                                                curve: Curves.easeIn);
                                          },
                                          child: Obx(() => AnimatedContainer(
                                                // margin: EdgeInsets.symmetric(horizontal:8.0),
                                                height:
                                                    activeCauroselPage.value ==
                                                            index
                                                        ? 18.0
                                                        : 8.0,
                                                width: 8.0,
                                                decoration: BoxDecoration(
                                                    color: activeCauroselPage
                                                                .value ==
                                                            index
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0) //     Colors.amber:Colors.grey
                                                    ),
                                                duration:
                                                    Duration(microseconds: 350),
                                                // radius: 5,
                                                // backgroundColor: activePage.value==index?
                                                //     Colors.amber:Colors.grey
                                              )),
                                        ),
                                      )),
                            ),
                          ))
                    ],
                  ));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMidContainerWithImage() {
    final buttonHeight = Constant.height / 1.2;
    final buttonWidth = Constant.width / 1.2;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(width: buttonHeight, color: Colors.grey.shade300),
        // Translate the button
        Transform.translate(
          offset: Offset(buttonHeight / 30.0, -buttonHeight / 30.0),
          child: Container(
              height: buttonHeight,
              width: buttonWidth,
              // decoration: BoxDecoration(
              //   color: Colors.orange[400],
              //   borderRadius: BorderRadius.circular(buttonHeight / 2.0),
              //   boxShadow: [
              //     BoxShadow(
              //       blurRadius: 16.0,
              //       offset: const Offset(0.0, 6.0),
              //       color: Colors.black.withOpacity(0.16),
              //     ),
              //   ],
              // ),
              // padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
              child: Image.network(
                  'https://api.lorem.space/image/fashion?w=640&h=480&r=4278',
                  fit: BoxFit.fill)),
        ),
      ],
    );
  }
}
