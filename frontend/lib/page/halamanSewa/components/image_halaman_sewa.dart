import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/halamanSewa/components/card_carousel.dart';

class ImageHalamanSewa extends StatefulWidget {
  final String image;
  const ImageHalamanSewa({super.key, required this.image});

  @override
  State<ImageHalamanSewa> createState() => _ImageHalamanSewaState();
}

class _ImageHalamanSewaState extends State<ImageHalamanSewa> {
  @override
  Widget build(BuildContext context) {
    print('ini gambar: ${widget.image}');
    return Stack(
      children: [
        Container(
          child: CardCarousel(images: [Constans.imageUrl + widget.image]),
        )
      ],
    );
  }
}
