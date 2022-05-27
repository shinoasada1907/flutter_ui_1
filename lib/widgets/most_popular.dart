import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/travel.dart';

class Mostpopular extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        scrollDirection: Axis.horizontal, //quy định cuộn ngang hay dọc
        itemBuilder: (context, index) {
          var travel = _list[index];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  travel.url,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                bottom: 20,
                left: 15,
              )
            ],
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
        itemCount: _list.length);
  }
}
