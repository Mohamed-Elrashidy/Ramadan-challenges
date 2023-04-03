import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_page/Controller/news_controller.dart';
import 'package:home_page/utils/dimensions.dart';
import 'package:home_page/view/pages/bottom_nav_bar_page.dart';
import 'package:home_page/view/widgets/category_widget.dart';
import 'package:home_page/view/widgets/iconWidget.dart';
import 'package:home_page/view/widgets/title_widget.dart';

import '../../model/news.dart';
import '../../utils/dummy_data.dart';

class NewsPage extends StatefulWidget {
  final News news;
  NewsPage({required this.news});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            pinned: true,
            expandedHeight: Dimension.scaleHeight(300),
            flexibleSpace: FlexibleSpaceBar(
              background: backgroundBuilder(),
            ),
          ),
          SliverList(

            delegate: SliverChildBuilderDelegate(
                childCount: 1, (BuildContext context, int index) => body()),
          )
        ],
      ),
    );
  }

  Widget backgroundBuilder() {
    return Stack(
      children: [
        photoWidget(widget.news.image),
        Container(
          color: Colors.black.withOpacity(0.2),
        ),
        DataView()
      ],
    );
  }

  Widget photoWidget(String path) {
    return Image.network(
      path,
      fit: BoxFit.cover,
      height: Dimension.scaleHeight(350),
      width: Dimension.screenWidth,
    );
  }

  Widget DataView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          Spacer(),
          CategoryWidget(category: widget.news.category),
          TitleWidget(title: widget.news.title),
          Row(
            children: [
              Text(
                widget.news.publisher,
                style: TextStyle(fontSize: 16, color: Colors.grey[200]),
              ),
              Icon(
                Icons.circle,
                size: 5,
                color: Colors.grey[200],
              ),
              Text(
                widget.news.date,
                style: TextStyle(fontSize: 16, color: Colors.grey[200]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimension.scaleHeight(30)),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Get.off(BottomNavBarPage());
              },
              child: IconWidget(icon: Icons.arrow_back_ios)),
          Spacer(),
          InkWell(
              onTap: () {
                setState(() {
                  NewsController().changeBookmarkState(widget.news);
                });
              },
              child: IconWidget(
                  icon:
                      (NewsController.bookmarkNews.containsKey(widget.news.id))
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined)),
          SizedBox(
            width: 5,
          ),
          IconWidget(icon: Icons.menu_outlined),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      //height: Dimension.scaleHeight(900),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        children: [
          bodyHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.news.data,
              style: TextStyle(fontSize: 16, color: Colors.black,),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(widget.news.publisherImage,
                  height: Dimension.scaleWidth(50),
                  width: Dimension.scaleWidth(50))),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.news.publisher,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.check_circle,
            color: Colors.blue,
            size: Dimension.scaleWidth(20),
          ),
        ],
      ),
    );
  }
}
