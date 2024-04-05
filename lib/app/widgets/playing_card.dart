import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';

String _setCardName(CardData cardData) {
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

class PlayingCard extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    String cardName = _setCardName(cardData);

    var cardsMoveableState = useState([cardData]);

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

    List<CardData> getCardsAvailableToMove() {
      if (cardData.lastColumnIndex == null) {
        return [cardData];
      }
      int column = cardData.lastColumnIndex!;
      int cardIndexInPlayColumn = appState
          .playColumns[cardData.lastColumnIndex!]
          .indexWhere((element) => element.id == cardData.id);
      List<CardData> availableCards =
          appState.playColumns[column].sublist(cardIndexInPlayColumn);
      print(availableCards);
      return availableCards;
    }

    List<CardData> moveableCards = getCardsAvailableToMove();

    return Transform.translate(
      offset: Offset(0, -3.0 * (index ?? 0)),
      child: Draggable<List<CardData>>(
        data: moveableCards,
        feedback: PlayingCardDraggableColumn(cardData: moveableCards),
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

class PlayingCardDraggableColumn extends StatelessWidget {
  final List<CardData> cardData;
  const PlayingCardDraggableColumn({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < cardData.length; i++)
          PlayingCardDraggablePreview(
              cardName: _setCardName(cardData[i]),
              suit: cardData[i].suit,
              isExpanded: i == cardData.length - 1)
      ],
    );
  }
}

class PlayingCardDraggablePreview extends StatelessWidget {
  final String cardName;
  final Suits suit;
  final bool isExpanded;
  const PlayingCardDraggablePreview(
      {super.key,
      required this.cardName,
      required this.suit,
      required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: suit.color,
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
                      color: suit.color,
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
                        suit.image,
                        colorFilter:
                            ColorFilter.mode(suit.color, BlendMode.srcIn),
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
                    suit.image,
                    colorFilter: ColorFilter.mode(suit.color, BlendMode.srcIn),
                  ),
                )
              ],
            ),
    );
  }
}