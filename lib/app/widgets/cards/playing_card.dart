import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/logic/playing_card.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/play_card_preview.dart';

class PlayingCard extends HookConsumerWidget {
  final CardData cardData;
  final int? index;
  final int column;
  const PlayingCard(
      {super.key, required this.cardData, required this.column, this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);

    String cardName = setCardName(cardData);
    bool isExpanded = getExpandedStatus(ref, column, cardData);
    bool inPlayColumn = column != PlayColumns.completedPile.index ||
        column != PlayColumns.freecell.index;

    List<CardData> moveableCards = getCardsAvailableToMove(cardData, ref);
    bool isDraggable = isCardDraggable(ref, index, column, isExpanded);

    return Draggable<List<CardData>>(
      data: moveableCards,
      maxSimultaneousDrags: isDraggable ? 1 : 0,
      onDragStarted: () {
        appStateActions.removeCardsFromPlayColumn(moveableCards);
      },
      onDraggableCanceled: (velocity, offset) {
        appStateActions.returnCardsOnDragCancel(moveableCards);
      },
      onDragEnd: (details) {
        if (details.wasAccepted == false) {
          appStateActions.returnCardsOnDragCancel(moveableCards);
        }
      },
      feedback: PlayingCardDraggableColumn(cardData: moveableCards),
      childWhenDragging: const SizedBox.shrink(),
      child: MouseRegion(
        cursor:
            isDraggable ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onDoubleTap: () {
            if (canCardBeCompleted(isExpanded, cardData, ref)) {
              appStateActions.removeCardsFromPlayColumn([cardData]);
              appStateActions.addCardToCompletedPile(cardData);
            }
          },
          child: RootPlayingCard(
              isExpanded: isExpanded,
              cardData: cardData,
              index: index,
              inPlayColumn: inPlayColumn,
              cardName: cardName),
        ),
      ),
    );
  }
}

class RootPlayingCard extends StatelessWidget {
  final bool isExpanded;
  final int? index;
  final CardData cardData;
  final bool inPlayColumn;
  final String cardName;
  const RootPlayingCard({
    super.key,
    required this.isExpanded,
    this.index,
    required this.cardData,
    this.inPlayColumn = true,
    required this.cardName,
  });

  @override
  Widget build(BuildContext context) {
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

    return DefaultTextStyle(
      style: const TextStyle(
          color: Colors.white,
          fontSize: GLOBAL_cardWidth / 2,
          fontWeight: FontWeight.bold),
      child: Transform.translate(
        offset: Offset(0, -3.0 * (index ?? 0)),
        child: Container(
          height: isExpanded ? GLOBAL_cardHeight : GLOBAL_cardHeight / 4,
          width: GLOBAL_cardWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    offset: const Offset(0, -2),
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
                  topLeft: const Radius.circular(5),
                  topRight: const Radius.circular(5))),
          child: isExpanded
              ? PlayingCardExpanded(
                  cardData: cardData,
                  inPlayColumn: inPlayColumn,
                  cardName: cardName)
              : PlayingCardCollapsed(cardName: cardName, cardData: cardData),
        ),
      ),
    );
  }
}

class PlayingCardCollapsed extends StatelessWidget {
  const PlayingCardCollapsed({
    super.key,
    required this.cardName,
    required this.cardData,
  });

  final String cardName;
  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          cardName,
          style: const TextStyle(
              color: Colors.black, fontSize: GLOBAL_cardWidth / 4),
        ),
        const SizedBox(
          width: GLOBAL_cardWidth / 15,
        ),
        SizedBox(
          height: GLOBAL_cardWidth / 5,
          width: GLOBAL_cardWidth / 5,
          child: SvgPicture.asset(
            cardData.suit.image,
            colorFilter: ColorFilter.mode(cardData.suit.color, BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}

class PlayingCardExpanded extends StatelessWidget {
  const PlayingCardExpanded({
    super.key,
    required this.cardData,
    required this.inPlayColumn,
    required this.cardName,
  });

  final CardData cardData;
  final bool inPlayColumn;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: GLOBAL_cardWidth / 2,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Flexible(
            child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: SizedBox(
              height: GLOBAL_cardWidth / 2,
              width: GLOBAL_cardWidth / 2,
              child: SvgPicture.asset(
                cardData.suit.image,
                colorFilter:
                    ColorFilter.mode(cardData.suit.color, BlendMode.srcIn),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
