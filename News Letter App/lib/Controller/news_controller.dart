import '../model/news.dart';

class NewsController{

  static Map<String,News>bookmarkNews={};
  List<News> getBookMarkList()
  {
    List<News> bookmarkList=[];
    bookmarkNews.forEach((key, value) {bookmarkList.add(value);});
    return bookmarkList;

  }

  void changeBookmarkState(News news)
  {
    if(bookmarkNews.containsKey(news.id))
      {
        //print("here////"+bookmarkNews.length.toString());
        bookmarkNews.remove(news.id);
      //  print("here////"+bookmarkNews.length.toString());


      }
    else
      {
        bookmarkNews.putIfAbsent(news.id, () => news);
      }
  }

}