import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:truly_freecell/app/app.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

class CompletedCardSlot extends StatelessWidget {
  final int completedPileIndex;
  final Suits suit;
  const CompletedCardSlot(
      {super.key, required this.completedPileIndex, required this.suit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: GLOBAL_cardHeight,
            width: GLOBAL_cardWidth * 1.1,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 3)),
            child: Center(
              child: SizedBox(
                  width: 50,
                  child: SvgPicture.asset(
                    suit.image,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.25), BlendMode.srcIn),
                  )),
            )),
      ],
    );
  }
}
