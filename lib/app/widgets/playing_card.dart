import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truly_freecell/app/models/card_data.dart';

class PlayingCard extends StatelessWidget {
  final CardData cardData;
  final bool isExpanded;
  final int? index;
  final bool inPlayColumn;
  const PlayingCard(
      {super.key,
      required this.cardData,
      required this.isExpanded,
      this.inPlayColumn = true,
      this.index});

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
    Color getBorderColor() {
      if (isExpanded == false) {
        return cardData.suit.color;
      }
      if (inPlayColumn) {
        return Colors.white;
      } else {
        return cardData.suit.color;
      }
    }

    return Transform.translate(
      offset: Offset(0, -3.0 * (index ?? 0)),
      child: Draggable<CardData>(
        data: cardData,
        feedback: PlayingCardDraggablePreview(
          cardData: cardData,
        ),
        childWhenDragging: SizedBox.shrink(),
        child: Container(
          height: isExpanded ? 120 : 40,
          width: 85,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    offset: Offset(0, -2),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              border: Border.all(
                width: 3,
                color: getBorderColor(),
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isExpanded ? 5 : 0),
                  bottomRight: Radius.circular(isExpanded ? 5 : 0),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5))),
          child: isExpanded
              ? Column(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardData.suit.color,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(inPlayColumn ? 5 : 0),
                              topRight: Radius.circular(inPlayColumn ? 5 : 0)),
                        ),
                        child: Center(
                          child: Text(
                            cardName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

class PlayingCardDraggablePreview extends StatelessWidget {
  final CardData cardData;
  const PlayingCardDraggablePreview({super.key, required this.cardData});

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

    return Container(
        height: 120,
        width: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: Offset(0, -2),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5))),
        child: Column(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: cardData.suit.color,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    cardName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
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
                    colorFilter:
                        ColorFilter.mode(cardData.suit.color, BlendMode.srcIn),
                  )),
            ))
          ],
        ));
  }
}
