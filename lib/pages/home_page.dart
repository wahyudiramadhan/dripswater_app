import 'package:dripswater/const/app_color.dart';
import 'package:dripswater/pages/product_page.dart';
import 'package:dripswater/widgets/app_button.dart';
import 'package:dripswater/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List image = [
    "Mask.png",
    "Mask.png",
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List itemContent = [
    "items1.jpg",
    "items2.jpg",
    "items3.jpg",
    "items4.jpg",
  ];
  String _selectedButton = 'All';

  void _selectButton(String buttonText) {
    setState(() {
      _selectedButton = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarColor: ColorApp.blueAppBarColor),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 70, left: 20, right: 20, bottom: 20),
                color: ColorApp.blueAppBarColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSmallText(
                      text: 'Welcome Back!',
                      color: ColorApp.textWhiteColor,
                    ),
                    const AppLargeText(
                      text: "Mr Product!",
                      color: ColorApp.textWhiteColor,
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: ColorApp.textFieldGrayColor.withOpacity(.10),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: ColorApp.textWhiteColor,
                        ),
                        hintText: "Search Something....",
                        hintStyle:
                            const TextStyle(color: ColorApp.textWhiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 180,
                child: PageView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.matrix(
                            [
                              0.5,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0.5,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0.5,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                            ],
                          ),
                          image: AssetImage("assets/images/Mask.png"),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: "Drips Springs",
                                color: ColorApp.textWhiteColor,
                              ),
                              AppSmallText(
                                text: "Bottle water delivery",
                                color: Colors.white,
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: AppButton(
                              text: "Quick Shop",
                              width: .3,
                              height: .05,
                              size: 10,
                              borderRadius: 10.0,
                              bgColor: ColorApp.yellowButtonColor,
                              textColor: ColorApp.textBlackColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: const AppSmallText(
                  text: "Water type",
                  color: ColorApp.textBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      changeAbleButton(title: "All"),
                      changeAbleButton(title: "Distiled"),
                      changeAbleButton(title: "Spring"),
                      changeAbleButton(title: "Purified"),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    // child: Text(_selectedButton), //usethis for changeabel wdget
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                    imgUrl:
                                        'assets/images/${itemContent[index]}',
                                  );
                                },
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/${itemContent[index]}",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 11, top: 12),
                                height: 62,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(5)),
                                  color: ColorApp.textWhiteColor,
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppSmallText(
                                      text: "Drips Spring Water",
                                      fontWeight: FontWeight.bold,
                                      color: ColorApp.textBlackColor,
                                    ),
                                    AppSmallText(text: "\$100"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeAbleButton({
    title = "Button",
  }) {
    return ElevatedButton(
      onPressed: () {
        _selectButton(title);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedButton == title
            ? ColorApp.darkGrayButtonColor
            : ColorApp.textGrayColor,
      ),
      child: Text(title),
    );
  }
}
