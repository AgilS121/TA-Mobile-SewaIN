import 'package:flutter/material.dart';
import 'package:frontend/page/halamanSewa/components/card_carousel.dart';

class ImageHalamanSewa extends StatefulWidget {
  const ImageHalamanSewa({super.key});

  @override
  State<ImageHalamanSewa> createState() => _ImageHalamanSewaState();
}

class _ImageHalamanSewaState extends State<ImageHalamanSewa> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CardCarousel(images: [
            'https://images.unsplash.com/photo-1542466500-dccb2789cbbb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
            'https://images.unsplash.com/photo-1542614471-001ccf2b449c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
          ]),
        )
      ],
    );
  }
}
