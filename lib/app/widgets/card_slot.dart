import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardSlot extends StatelessWidget {
  final String? backgroundImage;
  const CardSlot({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          width: 85,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 3)),
          child: Center(
              child: SizedBox(
                  width: 50,
                  child: backgroundImage == null
                      ? null
                      : SvgPicture.asset(
                          backgroundImage!,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.25), BlendMode.srcIn),
                        ))),
        ),
      ],
    );
  }
}
