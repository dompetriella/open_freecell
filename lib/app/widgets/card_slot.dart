import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

double _cardHeight = 135;
double _cardWidth = 100;

class CompletedCardSlot extends StatelessWidget {
  final String backgroundImage;
  const CompletedCardSlot({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: _cardHeight,
            width: _cardWidth,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 3)),
            child: Center(
              child: SizedBox(
                  width: 50,
                  child: SvgPicture.asset(
                    backgroundImage,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.25), BlendMode.srcIn),
                  )),
            )),
      ],
    );
  }
}

class FreeCellSlot extends HookWidget {
  const FreeCellSlot({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<CardData?> cardData = useState(null);
    return DragTarget<CardData>(onAcceptWithDetails: (details) {
      cardData.value = details.data.copyWith(isExpanded: true);
    }, builder: (context, candidateData, rejectedData) {
      return Container(
        height: _cardHeight,
        width: _cardWidth,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white, width: 3)),
        child: cardData.value != null
            ? PlayingCard(cardData: cardData.value!)
            : null,
      );
    });
  }
}
