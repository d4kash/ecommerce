import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liftu_ecommerce/constants/constant.dart';
import 'package:liftu_ecommerce/screens/productDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List category = [
    'All Products',
    'Smartphone',
    'Wearable',
    'Camera',
    'Footwear'
  ];
  final RxInt activeCategory = 0.obs;
 final RxInt activeCauroselPage = 0.obs;
  final PageController _pageController =
      PageController(initialPage: 100, viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: Constant.height / 10,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://api.lorem.space/image/face?w=640&h=480&r=867'),
                          ),
                        ),
                        //  SizedBox(
                        //   width: Constant.width / 19.4,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Constant.height / 40),
                                ),
                                Text(
                                  'Krishna KN',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Constant.height / 38),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Constant.width / 3.1,
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: Constant.width / 17,
                        ),
                        const Icon(Icons.menu)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Constant.height / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      //margin: EdgeInsets.symmetric(vertical: 20),
                      height: Constant.height / 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey.shade100),
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text('Search for Brand'),
                          //  focusedBorder: InputBorder.none,
                          //  disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Constant.height / 30,
                  ),
                  Container(
                    height:Constant.height/3.5,
                    child: CarouselSlider(
  options: CarouselOptions(height: 400.0,viewportFraction: 1.0,
   autoPlay: true,
                  onPageChanged: (value, reason) => activeCauroselPage.value = value),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin:const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    padding:const EdgeInsets.only(left: 8.0,top:8.0),
                    width: Constant.width/2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get Pixel 7 and Pixel 7 Pro', maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: Constant.height/35,fontWeight: FontWeight.bold),),
                        Text('Full Speed ahead', maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: Constant.height/45,fontWeight: FontWeight.w400,color: Colors.grey),),
                      ],
                    ),
                  ),
                       Container(
                        padding:const EdgeInsets.only(right: 8.0,top:8.0),
                    width: Constant.width/2.5,
                    height: Constant.height/1.5,
                         child: Image.network(
                                  'https://api.lorem.space/image/fashion?w=640&h=480&r=4278'),
                       ),  
                ],
              ),
              Positioned(
                            top: 150,
                            left: -250,
                            right: 0,
                            height: 100,
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(
                                    5,
                                    (index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: InkWell(
                                            onTap: () {
                                              _pageController.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeIn);
                                            },
                                            child: Obx(() =>
                                                AnimatedContainer(
                                                  // margin: EdgeInsets.symmetric(horizontal:8.0),
                                                  width: activeCauroselPage.value ==
                                                          index
                                                      ? 22.0
                                                      : 8.0,
                                                  height: 8.0,
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
                                                  duration: Duration(
                                                      microseconds: 350),
                                                  // radius: 5,
                                                  // backgroundColor: activePage.value==index?
                                                  //     Colors.amber:Colors.grey
                                                )),
                                          ),
                                        )),
                              ),
                            ))
         
            ],
          )
        );
      },
    );
  }).toList(),
),
                  ),
                  SizedBox(
                    height: Constant.height /45,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 18.0),
                    width: Constant.width,
                    height: Constant.height / 16,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => activeCategory.value = index,
                            child: Obx(() => Card(
                                  color: activeCategory.value == index
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        category[index],
                                        style: TextStyle(
                                            color: activeCategory.value == index
                                                ? Colors.white
                                                : Colors.black26,
                                            fontSize: Constant.height / 45),
                                      )),
                                )),
                          );
                        }),
                  ),
                  SizedBox(
                    height: Constant.height /50,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Arrival',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: Constant.height / 36),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: Constant.height / 46)),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: Constant.width,
                    height: Constant.height / 2.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                                tag: 'productDetails$index',
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(() =>  ProductDetails(index:index));
                                    },
                                    child: const ProductsCard())),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade300,
        child: Container(
          width: Constant.width / 2.2,
          child: Column(
            children: [
              SizedBox(
                width: Constant.width,
                height: Constant.height / 25,
                child: const Text(''),
              ),
              _buildMidContainerWithImage(),
              // Positioned(
              //   top: 10,
              //   child: Container(
              //     height: Constant.height/4,
              //     width: Constant.width/2,
              //     child: Image.network('https://api.lorem.space/image/face?w=640&h=480&r=867')),
              // )

              Container(
                color: Colors.white,
                width: Constant.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'iPhone 14 Pro',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constant.height / 55),
                      ),
                      SizedBox(
                        height: Constant.height / 32,
                      ),
                      Text(
                        'A magical New way to interact with iphone 14 pro max',
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: Constant.height / 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ 999',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constant.height / 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.black,
                                  ),
                                  height: Constant.height / 25,
                                  width: Constant.width / 13,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                          // ElevatedButton.icon(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.black,
                          //     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8)
                          //   ),
                          //   onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,), label: Text(''))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildMidContainerWithImage() {
    const buttonHeight = 100.0;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(height: buttonHeight, color: Colors.white),
        // Translate the button
        Transform.translate(
          offset: const Offset(0.0, -buttonHeight / 5.0),
          child: Center(
            child: Container(
                height: buttonHeight,
                 width: buttonHeight,
                decoration: BoxDecoration(
                  // color: Colors.orange[400],
                  // borderRadius: BorderRadius.circular(buttonHeight / 2.0),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 16.0,
                  //     offset: const Offset(0.0, 6.0),
                  //     color: Colors.black.withOpacity(0.16),
                  //   ),
                  // ],
                ),
                // padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
                child: Image.network(
                    'https://api.lorem.space/image/face?w=640&h=480&r=867',
                    fit: BoxFit.contain)),
          ),
        ),
      ],
    );
  }
}
