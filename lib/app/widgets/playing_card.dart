import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truly_freecell/app/models/card_data.dart';

class PlayingCard extends StatelessWidget {
  final CardData cardData;
  const PlayingCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    String setCardName(CardData cardData) {
      if (cardData.value > 1 && cardData.value < 11) {
        return cardData.value.toString();
      } else if (cardData.value == 11) {
        return 'J';
      } else if (cardData.value == 12) {
        return 'Q';
      } else if (cardData.value == 13) {
        return 'K';
      } else {
        return 'A';
      }
    }

    String cardName = setCardName(cardData);

    return Draggable<CardData>(
      data: cardData,
      feedback: PlayingCard(cardData: cardData),
      childWhenDragging: SizedBox.shrink(),
      child: Container(
        height: cardData.isExpanded ? 120 : 40,
        width: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 3,
              color: cardData.suit.color,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cardData.isExpanded ? 5 : 0),
                bottomRight: Radius.circular(cardData.isExpanded ? 5 : 0),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5))),
        child: cardData.isExpanded
            ? Column(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(color: cardData.suit.color),
                      child: Center(
                        child: Text(
                          cardName,
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          cardData.suit.image,
                          colorFilter: ColorFilter.mode(
                              cardData.suit.color, BlendMode.srcIn),
                        )),
                  ))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardName,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      cardData.suit.image,
                      colorFilter: ColorFilter.mode(
                          cardData.suit.color, BlendMode.srcIn),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
