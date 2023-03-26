import 'package:home_page/news.dart';
import 'package:intl/intl.dart';

class DummyData{
  static List<News> breakingNewsList=[News(
    title: "Alexander wears modified helmet in road races",
    category: 'Sports',
    publisher: 'CNNIndonesia',
    publisherImage: 'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png?v=10.7.6',
      image: 'https://images.immediate.co.uk/production/volatile/sites/21/2021/06/GettyImages-1327518666-3b7f6a2.jpg?quality=90&resize=768%2C574',
    date: DateFormat('yMMMd').format(DateTime.now()),

  ),
    News(
      title: "What training Do volleyball Players Need?",
      category: 'Sports',
      publisher: 'McKindeny',
      publisherImage: 'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      image: 'https://www.mmu.ac.uk/sites/default/files/styles/page_header_half/public/2022-07/Mens%20VolleyBall%20-4%20%281%29.jpg?h=7c631cf1&itok=5DkSO2qD',
      date: DateFormat('yMMMd').format(DateTime.now()),

    ),News(
      title: "Secondary school places: when do parents find our?",
      category: 'Education',
      publisher: 'CNNIndonesia',
      publisherImage: 'https://pbs.twimg.com/profile_images/1485050791488483328/UNJ05AV8_400x400.jpg',
      image: 'https://img.freepik.com/free-photo/focused-haired-latin-girl-sitting-school-desk-drawing-her-copybook_74855-16368.jpg',
      date: DateFormat('yMMMd').format(DateTime.now()),

    ),

  ];


}