import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/product_list_screen_controller.dart';

class SubCategoryWidget extends StatefulWidget {
  ProductListScreenController controller;

  SubCategoryWidget({required this.controller});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  ProductListScreenController controller = ProductListScreenController();

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: Drawer(
              width: 250,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: DrawerHeader(
                        decoration:
                        BoxDecoration(color: Colors.blue),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              margin: EdgeInsets.only(right: 10),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                            Container(
                              height: 30,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "SHOPPING BAG " +
                                    "(${controller.count1.data})",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                      flex: 9,
                      child: (controller.hasData.isFalse)
                          ? Center(child: CircularProgressIndicator())
                          : (isNullEmptyOrFalse(controller.cartProductList))
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 250,
                              child: SvgPicture.asset("assets/NoData.svg"),
                            ),
                            Text(
                              "No data found",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color.fromRGBO(33, 43, 54, 1)),
                            ),
                          ],
                        ),
                      )
                          : ListView.builder(
                        itemCount:
                        controller.cartProductList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        CachedNetworkImage(
                                            imageUrl:
                                            "${controller.cartProductList[index]
                                                .product!.images![0]}",
                                            imageBuilder: (context,
                                                imageProvider) =>
                                                Container(
                                                  margin: EdgeInsets
                                                      .all(10),
                                                  height: 80,
                                                  width: 80,
                                                  decoration:
                                                  BoxDecoration(
                                                    image: DecorationImage(
                                                        image:
                                                        imageProvider,
                                                        fit: BoxFit
                                                            .cover,
                                                        colorFilter: ColorFilter
                                                            .mode(
                                                            Colors
                                                                .transparent,
                                                            BlendMode
                                                                .colorBurn)),
                                                  ),
                                                ),
                                            placeholder: (context,
                                                url) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context,
                                                url, error) =>
                                                Expanded(
                                                    child:
                                                    Container(
                                                      color: Colors
                                                          .grey[100],
                                                    ))),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 8.0, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "${controller
                                                  .cartProductList[index]
                                                  .product!.title}",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller
                                                  .CartDeleteApi(
                                                data: controller
                                                    .cartProductList[
                                                index],
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete_rounded,
                                              color: Colors.cyan,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  indent: 2,
                                  color: Colors.grey.shade500,
                                  endIndent: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 34,
                                        margin: EdgeInsets.only(
                                            left: 8),
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.3,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.only(
                                            topLeft:
                                            Radius.circular(20),
                                            topRight:
                                            Radius.circular(20),
                                            bottomRight:
                                            Radius.circular(20),
                                            bottomLeft:
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            color: Colors
                                                .grey.shade400,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .UpdateCartRemove(
                                                      data: controller
                                                          .cartProductList[
                                                      index],
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left:
                                                        8.0,
                                                        right:
                                                        5),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors
                                                          .black,
                                                      size: 22,
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                                child: Container(
                                                  height: 75,
                                                  width: 75,
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .grey.shade300,
                                                    border: Border(
                                                      left: BorderSide(
                                                        color:
                                                        Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                      right: BorderSide(
                                                        color:
                                                        Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                        "${controller
                                                            .cartProductList[index]
                                                            .quantity}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey
                                                                .shade500,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500),
                                                      )),
                                                )),
                                            Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .UpdateCartAdd(
                                                      data: controller
                                                          .cartProductList[
                                                      index],
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors
                                                        .black,
                                                    size: 22,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text(
                                        "\u{20B9}${controller
                                            .cartProductList[index].product!
                                            .discountedPrice! *
                                            controller.cartProductList[index]
                                                .quantity!}.00",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight:
                                            FontWeight.w800),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )),
                  controller.cartProductList == null
                      ? Container()
                      : Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount:
                        controller.cartProductList.length,
                        itemBuilder: (context, index) {
                          var sum = 0;
                          controller.cartProductList.forEach((element) {
                            sum += element.product!.discountedPrice! *
                                element.quantity!;
                          });
                          return Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "SUBTOTAL",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w700,
                                          color: Colors
                                              .grey.shade600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          8.0),
                                      child: Text(
                                        "\u{20B9}${sum}.00",
                                        style: TextStyle(
                                            color:
                                            Colors.orange,
                                            fontWeight:
                                            FontWeight
                                                .w800),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 15.0,
                                      left: 8,
                                      right: 8),
                                  child: getcon(
                                      alignment:
                                      Alignment.center,
                                      color: Colors.cyan,
                                      height: 30,
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      text: Text(
                                        "VIEW CART",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w800,
                                            color:
                                            Colors.white),
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                ],
              )),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              controller.subCategoryData.name.toString(),
              style: GoogleFonts.roboto(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back)),
            actions: [
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!
                            .openEndDrawer();
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.grey[500],
                      )),
                  controller.count1.data == null
                      ? Container()
                      : Positioned(
                      left: 22,
                      top: 2,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(
                              32, 193, 244, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${controller.count1.data}",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                ],
              )
            ],
          ),
          body:
          (controller.hasData.isFalse)
              ? Center(
            child: CircularProgressIndicator(),
          )
              : (isNullEmptyOrFalse(controller.mainProductList))
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 300,
                    width: 250,
                    child: SvgPicture.asset("assets/NoData.svg")),
                Text(
                  "No data found",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromRGBO(33, 43, 54, 1)),
                ),
              ],
            ),
          )
              : Container(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: controller.mainProductList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.VIEW_PRODUCT,
                                  arguments: controller.mainProductList[index]);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 170,
                                                    height: 140,
                                                    alignment: Alignment
                                                        .center,
                                                    color: Colors.white,
                                                    margin:
                                                    EdgeInsets.only(
                                                        top: 25,
                                                        left: 10,
                                                        right: 10),
                                                    child:
                                                    CachedNetworkImage(
                                                        imageUrl:
                                                        "${controller
                                                            .mainProductList[index]
                                                            .images![0]}",
                                                        imageBuilder:
                                                            (context,
                                                            imageProvider) =>
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    colorFilter: ColorFilter
                                                                        .mode(
                                                                        Colors
                                                                            .transparent,
                                                                        BlendMode
                                                                            .colorBurn)),
                                                              ),
                                                            ),
                                                        placeholder:
                                                            (context,
                                                            url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                            url,
                                                            error) =>
                                                            Icon(Icons
                                                                .error)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double
                                                        .maxFinite,
                                                    height: 80,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              left:
                                                              90),
                                                          height: 20,
                                                          width: 70,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .red,
                                                            borderRadius:
                                                            BorderRadius
                                                                .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                  20),
                                                              topRight:
                                                              Radius.circular(
                                                                  20),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Save ${controller
                                                                  .mainProductList[index]
                                                                  .discount!
                                                                  .toStringAsFixed(
                                                                  0)} %",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  fontSize:
                                                                  9),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 30,
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.mainProductList[index]
                                              .sellerId!.companyName}",
                                          style: GoogleFonts.raleway(
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 13,
                                              color: Color.fromRGBO(
                                                  32, 193, 244, 1)),
                                        )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 180,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 25),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.mainProductList[index]
                                              .category!.name} - ${controller
                                              .mainProductList[index]
                                              .subCategory!.name} ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey),
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                        EdgeInsets.only(left: 10),
                                        child: Text(
                                          "₹${controller.mainProductList[index]
                                              .price!.toStringAsFixed(2)}",
                                          style: GoogleFonts.roboto(
                                              decoration: TextDecoration
                                                  .lineThrough,
                                              color: Colors.grey,
                                              fontSize: 8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        child: Text(
                                          "₹${controller.mainProductList[index]
                                              .discountedPrice!.toStringAsFixed(
                                              2)}",
                                          style:
                                          TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      RatingBarIndicator(
                                        rating: double.parse(controller
                                            .mainProductList[index]
                                            .rating
                                            .toString()),
                                        itemBuilder: (context, index) =>
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("${controller.mainProductList[index]
                                          .sId}");
                                      controller.addToCart(
                                        data: controller
                                            .mainProductList[index],
                                      );
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomRight:
                                          Radius.circular(25),
                                          bottomLeft:
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(Icons.add_shopping_cart,
                                              color: Colors.white,
                                              size: 18),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "ADD TO CART",
                                            style: GoogleFonts.raleway(
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.63)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
