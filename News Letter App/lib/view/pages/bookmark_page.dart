import 'package:flutter/material.dart';
import 'package:home_page/Controller/news_controller.dart';


import '../widgets/data_view.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:
            [
              SizedBox(height: 10,),

              Text("Bookmark Page",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              SizedBox(
                //height: Dimension.scaleHeight(500),
                child: ListView.builder(
                    shrinkWrap: true,

                    itemCount:     NewsController().getBookMarkList().length,

                    itemBuilder:(_,int index){
                  return  Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              NewsController().getBookMarkList()[index].image,
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
                              child: DataView( news:  NewsController().getBookMarkList()[index],),
                            ),
                          )
                        ],
                      ));

  }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
