import 'package:flutter/material.dart';
import 'package:open_freecell/app/logic/playing_card.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';

class PlayingCardDraggableColumn extends StatelessWidget {
  final List<CardData> cardData;
  const PlayingCardDraggableColumn({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < cardData.length; i++)
          RootPlayingCard(
              isExpanded: i == cardData.length - 1,
              index: i,
              cardData: cardData[i],
              cardName: setCardName(cardData[i]))
      ],
    );
  }
}
