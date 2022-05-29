import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _builderSliverHead(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 15, right: 15, top: MediaQuery.of(context).padding.top),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _builderSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDeleget(
        travel: travel,
        expandedHeight: expandedHeight,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }
}

class DetailSliverDeleget extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDeleget({
    required this.travel,
    required this.expandedHeight,
    required this.roundedContainerHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                travel.location,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          top: expandedHeight - shrinkOffset - 120,
          left: 30,
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
