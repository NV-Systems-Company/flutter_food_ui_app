import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.sort,
            size: 35.0,
          ),
          Badge(
            badgeContent: Text(
              '3',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            badgeColor: Colors.white,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(-3.0, -3.0),
                      blurRadius: 6.0,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(3.0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Icon(
                Icons.shopping_cart,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
