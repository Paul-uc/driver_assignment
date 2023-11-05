import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;

  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: AssetImage(image),
            height: size.height * 0.2),
        SizedBox(height: heightBetween,),
        Text(title,
            style: Theme.of(context).textTheme.headlineLarge),
        Text(subTitle,
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
