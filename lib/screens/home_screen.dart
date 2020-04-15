import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_ui_app/models/food_model.dart';
import 'package:flutter_food_ui_app/screens/detail_screen.dart';
import 'package:flutter_food_ui_app/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  List foodItems = [
    {
      "imageUrl": 'assets/images/image1.jpg',
      "name": 'Breakfast',
    },
    {
      "imageUrl": 'assets/images/image2.jpg',
      "name": 'Lunch',
    },
    {
      "imageUrl": 'assets/images/image3.jpg',
      "name": 'Snacks',
    },
    {
      "imageUrl": 'assets/images/image4.jpg',
      "name": 'Dinner',
    }
  ];

  buildFoodRow(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: (screenWidth - 100.0) / 4,
          height: (screenWidth - 100.0) / 4,
          child: Image(
            image: AssetImage(foodItems[index]["imageUrl"]),
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          foodItems[index]["name"],
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  buildRating(int index, int rating) {
    return Icon(
      Icons.star,
      size: 15.0,
      color: (index + 1) <= rating
          ? Color.fromRGBO(255, 193, 7, 1.0)
          : Colors.grey,
    );
  }

  buildPopularListItem(Food food) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailScreen(
            food: food,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 220.0,
              width: 170.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5.0, 5.0),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8.0,
                  ),
                  BoxShadow(
                    offset: Offset(-5.0, -5.0),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      child: Hero(
                        tag: food.imageUrl,
                        child: Image(
                          image: AssetImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 140.0,
                            child: Text(
                              food.name,
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        5,
                        (index) => buildRating(index, food.rating),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 35.0,
              child: Container(
                width: 100.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'View mores',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Header(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Food',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<Widget>.generate(
                          foodItems.length,
                          (int index) => buildFoodRow(index),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Popular Food',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'View mores',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 3.0,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foods.length,
                        itemBuilder: (BuildContext context, int index) {
                          Food food = foods[index];
                          return buildPopularListItem(food);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Valentine Day Offer',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 100.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Positioned(
                              bottom: 5.0,
                              left: 20.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 85.0,
                                    width: 85.0,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/image1.jpg'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    height: 85.0,
                                    width: 85.0,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/image1.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 30.0,
                              top: 10.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Free salads for every couple!',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => buildRating(index, 5),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
              color: currentTab == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: currentTab == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              size: 30.0,
              color: currentTab == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30.0,
              color: currentTab == 3
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
