import 'package:flutter/material.dart';

void main() {
  runApp(const MyGallery());
}

class MyGallery extends StatelessWidget {
  const MyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Code Assignment 2",
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 720,
            width: 500,
            child: Stack(
              children: [
                Container(
                  height: 720,
                  width: 500,
                  color: Colors.deepPurple,
                ),

                Center(
                  child: MyGalleryWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGalleryWidget extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<MyGalleryWidget> {
  List<String> ImageList = [
    "assets/HelloKittyPlush.jpg",
    "assets/KuromiPlush.jpg",
    "assets/MyMelodyPlush.jpg" ,
    "assets/PompompurinPlush.jpg"
  ];

  List<String> NameList = [
    'Hello Kitty',
    'Kuromi',
    'My Melody',
    'Pompompurin'
  ];

   List<String> YearList = [
    '1974',
    '2005',
    '1975',
    '1996'
  ];

  int _Index = 0;

  void _IncrementIndex() {
    setState(() {
      _Index++;
      if (_Index > 3) {
        _Index = 0;
      };
    });
  }

void _DecrementIndex() {
    setState(() {
      _Index--;
      if (_Index < 0) {
        _Index = 3;
      };
    });
  }

 @override
 Widget build(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),

        Image.asset(
          ImageList[_Index],
          height: 475,
          width: 475,
        ),
        
        const SizedBox(height: 20),

        Text(
          "${NameList[_Index]}",
          style: TextStyle( 
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "Created in ${YearList[_Index]}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                _DecrementIndex();
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  Text('Prev'),
                ],
              ),
            ),
MaterialButton(
              onPressed: () {
                _IncrementIndex();
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward),
                  Text('Next'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}