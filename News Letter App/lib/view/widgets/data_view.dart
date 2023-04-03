import 'package:flutter/material.dart';

import '../../model/news.dart';

class DataView extends StatelessWidget {
  final News news;
  const DataView({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(news.category,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[400])),
          Text(news.title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Row(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      news.publisherImage,
                      fit: BoxFit.cover,
                    )),
                height: 30,
                width: 30,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 5,
              ),
              Text(news.publisher,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[400])),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.circle,
                size: 5,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(news.date,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[400])),
            ],
          )
        ],
      ),
    );
  }
}
