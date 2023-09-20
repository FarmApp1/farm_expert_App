import 'package:flutter/material.dart';

void main() {
  runApp(NewsFeed());
}

class NewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  // Sample list of news feed items with images
  final List<NewsFeedItem> newsfeed = [
    NewsFeedItem(
      'Botrytis Gray Mold',
      'Avoid overhead irrigation where possible, always sanitize gardening tools, and maintain adequate air circulation between plants to help keep this disease under control.',
      'assets/images/news1.jpg',
    ),
    NewsFeedItem(
      ' Anthracnose ',
      'The fungus Colletotrichum coccodes easily colonizes lower leaves that are damaged from early blight or flea beetle infestations, and produces spores that spread to the fruit.',
      'assets/images/news2.jpg',
    ),
    NewsFeedItem(
      'Head Splitting',
      'Plants need 1-1.5 inches of water per week. Adjust your supplemental watering schedule accordingly when rain is predicted.Use your best judgment at harvest time. If heavy rain is predicted, it may be better to have slightly smaller heads than larger, split ones.',
      'assets/images/news3.jpg',
    ),
    // Add more news feed items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solutions'),
      ),
      body: ListView.builder(
        itemCount: newsfeed.length,
        itemBuilder: (context, index) {
          final item = newsfeed[index];
          return NewsFeedCard(item: item);
        },
      ),
    );
  }
}

class NewsFeedItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsFeedItem(this.title, this.description, this.imageUrl);
}

class NewsFeedCard extends StatelessWidget {
  final NewsFeedItem item;

  NewsFeedCard({required this.item});

  @override
   Widget build(BuildContext context) {
     return Card(
       margin: EdgeInsets.all(10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Image.asset(
             item.imageUrl,
             fit: BoxFit.cover,
             height: 200,
           ),
  
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
