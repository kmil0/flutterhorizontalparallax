import 'package:flutter/material.dart';
import 'package:scroll_parallax/Data/in_memory_images.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Star\nWars',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 50,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1977',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'A stormtrooper is a fictional soldier in the Star Wars franchise created by George Lucas.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Galatic Empire',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 420,
                    padding: EdgeInsets.only(bottom: 30),
                    child: PageView.builder(
                        itemCount: paintings.length,
                        controller: pageController,
                        itemBuilder: (context, i) {
                          return Transform.scale(
                            scale: 1,
                            child: Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      paintings[i]['image'],
                                      height: 370,
                                      fit: BoxFit.cover,
                                      alignment:
                                          Alignment(-pageOffset.abs() + i, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 20,
                                    right: 1,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          gradient: LinearGradient(colors: [
                                            Color(0x36FFFFFF),
                                            Color(0x0FFFFFFF)
                                          ])),
                                      child: Text(
                                        paintings[i]['name'],
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 25,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
