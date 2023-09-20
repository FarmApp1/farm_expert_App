import 'package:flutter/material.dart';

void main() {
  runApp(UserProblem());
}

class Shoe {
  final String name;
  final String imageUrl;
  final String description;

  Shoe(this.name, this.imageUrl, this.description);
}

class UserProblem extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(
      "Nike Air Zoom Pegasus 38",
      "assets/images/news1.jpg",
      "The Nike Air Zoom Pegasus 38 continues to put a spring in your step, using the same responsive foam as its predecessor. Breathable mesh in the upper combines the comfort and durability you want with a wider fit at the toes.",
    ),
    Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news2.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
    Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news3.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news4.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news5.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news6.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news7.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news8.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news9.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news10.png",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
     Shoe(
      "Adidas Ultraboost 21",
      "assets/images/news11.jpg",
      "The Ultraboost 21 combines incredible energy return with an adaptive fit for a comfortable run. The lightweight upper is made with Parley Ocean Plastic, upcycled plastic waste intercepted on remote islands, beaches, coastal communities, and shorelines, preventing it from polluting our oceans.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Users Problems'),
        ),
        body: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return ShoeCard(shoe: shoe);
          },
        ),
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Image.network(
            shoe.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              shoe.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
