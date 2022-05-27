import 'package:flutter/material.dart';
import 'package:flutter_ui_1/widgets/most_popular.dart';
import 'package:flutter_ui_1/widgets/travel_blog.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Travel Blog',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Expanded(
            child: TravelBlog(),
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Most Popular',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Mostpopular(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
