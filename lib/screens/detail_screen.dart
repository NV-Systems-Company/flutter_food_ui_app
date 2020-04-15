import 'package:flutter/material.dart';
import 'package:flutter_food_ui_app/models/food_model.dart';
import 'package:flutter_food_ui_app/widgets/header.dart';

class DetailScreen extends StatefulWidget {
  Food food;
  DetailScreen({this.food});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  buildRating(int index, int rating) {
    return Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: Icon(
        Icons.star,
        size: 20.0,
        color: (index + 1) <= rating
            ? Color.fromRGBO(255, 193, 7, 1.0)
            : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentTab = 0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Header(),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Hero(
                tag: widget.food.imageUrl,
                child: Image(
                  image: AssetImage(widget.food.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.food.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: List.generate(
                  5,
                  (index) => buildRating(index, widget.food.rating),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
                children: <Widget>[
                  Text(
                    'About the food',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
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
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    child: Text(
                      widget.food.description,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
                width: MediaQuery.of(context).size.width - 40.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Add to Basket',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
