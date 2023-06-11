import 'package:flutter/material.dart';

class CardCarousel extends StatefulWidget {
  final List<String> images;
  const CardCarousel({Key? key, required this.images}) : super(key: key);

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  late PageController pageController;
  int currentIndex = 0;

  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: currentIndex, viewportFraction: 0.8);
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.images.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (BuildContext context, widget) {
              double value = 1;
              if (pageController.position.haveDimensions) {
                value = pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * 295,
                  width: Curves.easeOut.transform(value) * 351,
                  child: widget,
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.images[index]),
                  ),
                ),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
