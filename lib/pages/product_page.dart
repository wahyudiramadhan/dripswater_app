import 'package:dripswater/const/app_color.dart';
import 'package:dripswater/pages/chart_page.dart';
import 'package:dripswater/widgets/app_button.dart';
import 'package:dripswater/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatefulWidget {
  final String imgUrl, name, price;

  const ProductPage({
    required this.imgUrl,
    this.name = "Drips Spring Water",
    this.price = "\$99",
    super.key,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

const List<String> list = <String>['50ml', '100ml', '200ml', '500ml'];

class _ProductPageState extends State<ProductPage> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1 / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.imgUrl),
                      ),
                    ),
                  ),
                  AppBar(
                    toolbarHeight: 75,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, top: 20, bottom: 10),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: ColorApp.darkGrayButtonColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.favorite_outline, size: 25),
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .4),
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 20, top: 20, bottom: 10),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: ColorApp.textWhiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 25,
                          color: ColorApp.blueAppBarColor,
                        ),
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 50),
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppLargeText(
                        text: widget.name,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppLargeText(
                        text: widget.price,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AppSmallText(
                      text:
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        AppSmallText(
                          text: "4.5",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        AppSmallText(text: "  (128 reviews)"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppSmallText(
                                text: "Bottle size",
                                fontWeight: FontWeight.bold,
                                color: ColorApp.textBlackColor,
                              ),
                              DropdownButton(
                                value: dropdownValue,
                                icon: Container(
                                  margin: EdgeInsets.only(left: 19),
                                  decoration: BoxDecoration(
                                    color: ColorApp.blueButtonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                elevation: 0,
                                style: const TextStyle(
                                    color: ColorApp.whiteGrayColor),
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSmallText(
                              text: "Quantity",
                              fontWeight: FontWeight.bold,
                              color: ColorApp.textBlackColor,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    onPressed: () {
                                      decrementQuantity();
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: AppLargeText(
                                    text: quantity.toString(),
                                    fontWeight: FontWeight.normal,
                                    color: ColorApp.textBlackColor,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    onPressed: () {
                                      incrementQuantity();
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ChartPage();
                        },
                      )),
                      child: const AppButton(
                        text: "Buy",
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
