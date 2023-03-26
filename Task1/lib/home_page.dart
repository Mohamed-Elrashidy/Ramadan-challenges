import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:home_page/dummy_data.dart';

import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildAppBar(),
              buildGroupTitle("Breaking news"),
              pageViewBuilder(),
              dotsView(),
              buildGroupTitle("Recommended"),
              recommendedNews()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox pageViewBuilder() {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: pageController,
        itemCount: DummyData.breakingNewsList.length,
        itemBuilder: (_, index) => Container(
            padding: EdgeInsets.all(8),
            // color: Colors.red,

            child: itemBuilder(index, DummyData.breakingNewsList[index])),
      ),
    );
  }

  Container buildGroupTitle(String title) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Spacer(),
          Text('view all',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue)),
        ],
      ),
    );
  }

  Container buildAppBar() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          iconFormat(Icons.list),
          Spacer(),
          iconFormat(Icons.search),
          SizedBox(width: 5),
          Stack(
            //  alignment: Alignment(10, 5),
            children: [
              iconFormat(Icons.notifications_none),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 10),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget itemBuilder(int index, News news) {
    Matrix4 matrix = Matrix4.identity();
    if (_currPageValue.floor() == index) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else
      matrix = Matrix4.diagonal3Values(1, 0.8, 1)..setTranslationRaw(0, 22, 0);
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          photoWidget(news.image),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        child: Text(news.category,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(news.publisher,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('. ' + news.date,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  Text(
                    news.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget photoWidget(String imgUri) {
    return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imgUri,
              fit: BoxFit.cover,
            )));
  }

  Widget iconFormat(IconData icon) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey[200]),
      padding: EdgeInsets.all(5),
      child: Icon(
        icon,
        size: 40,
      ),
    );
  }

  Widget dotsView() {
    return DotsIndicator(
      dotsCount: DummyData.breakingNewsList.length,
      position: _currPageValue,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget recommendedNews() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: DummyData.breakingNewsList.length,
        itemBuilder: (_, index) => Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    DummyData.breakingNewsList[index].image,
                    fit: BoxFit.cover,
                    width: (150),
                    height: (150),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                    child: DataView(DummyData.breakingNewsList[index]),
                  ),
                )
              ],
            )));
  }

  Widget DataView(News news) {
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
