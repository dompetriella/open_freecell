import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/logic/playing_card.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';

class CompletedCardSlot extends ConsumerWidget {
  final int completedPileIndex;
  final Suits suit;
  const CompletedCardSlot(
      {super.key, required this.completedPileIndex, required this.suit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var appStateActions = ref.watch(appStateProvider.notifier);

    double cardLengthsToCenter =
        (MediaQuery.sizeOf(context).width / 2) / GLOBAL_cardWidth;
    print(cardLengthsToCenter);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: GLOBAL_cardHeight,
            width: GLOBAL_cardWidth,
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
                        Colors.white.withOpacity(0.50), BlendMode.srcIn),
                  )),
            )),
        for (int i = 0; i < appState.completedPiles[suit.index].length; i++)
          PlayingCard(
                  cardData: appState.completedPiles[suit.index][i],
                  column: PlayColumns.completedPile.index)
              .animate()
              .slide(
                  begin: Offset(1.5, 0),
                  duration: 500.ms,
                  curve: Curves.decelerate)
              .then()
              .shimmer(duration: 500.ms),
        DragTarget(
          onAcceptWithDetails: (DragTargetDetails<List<CardData>> details) {
            appStateActions.removeCardsFromPlayColumn([details.data.first]);
            appStateActions.addCardToCompletedPile(details.data.first);
          },
          onWillAcceptWithDetails: (DragTargetDetails<List<CardData>> details) {
            if (canCardBeCompleted(true, details.data.first, ref) &&
                details.data.first.suit == suit) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: GLOBAL_cardHeight,
              width: GLOBAL_cardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        )
      ],
    );
  }
}
