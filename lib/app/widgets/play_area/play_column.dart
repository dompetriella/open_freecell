import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';

class PlayColumn extends HookConsumerWidget {
  final int columnIndex;
  const PlayColumn({
    super.key,
    required this.columnIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var appStateActions = ref.watch(appStateProvider.notifier);
    var isHovering = useState(false);

    return DragTarget<List<CardData>>(
      onWillAcceptWithDetails: (details) {
        bool willAccept = false;

        if (details.data.last.lastColumnIndex != columnIndex) {
          isHovering.value = true;
          willAccept = false;
        }

        if (appState.playColumns[columnIndex].isEmpty) {
          willAccept = true;
        }

        // checks if the number is lower than the last value in column
        // then checks if the suit enum indexes DONT match
        // hearts AND diamonds % 2 will be 0
        if (appState.playColumns[columnIndex].isNotEmpty) {
          if (appState.playColumns[columnIndex].last.value ==
                  details.data.first.value + 1 &&
              appState.playColumns[columnIndex].last.suit.index % 2 !=
                  details.data.first.suit.index % 2) {
            willAccept = true;
          }
        }

        return willAccept;
      },
      onLeave: (data) {
        isHovering.value = false;
      },
      onAcceptWithDetails: (details) {
        isHovering.value = false;
        appStateActions.addCardsToPlayColumn(details.data, columnIndex, ref);
      },
      builder: (context, candidateData, rejectedData) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      isHovering.value
                          ? Colors.white.withOpacity(.5)
                          : Colors.transparent,
                      Colors.transparent
                    ])),
            child: Column(
                children: appState.playColumns[columnIndex].isEmpty
                    ? [
                        Container(
                          width: GLOBAL_cardWidth,
                          height: GLOBAL_cardHeight * 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(.5),
                                    Colors.transparent
                                  ])),
                        )
                      ]
                    : [
                        for (int j = 0;
                            j < appState.playColumns[columnIndex].length;
                            j++)
                          PlayingCard(
                            cardData: appState.playColumns[columnIndex][j],
                            column: columnIndex,
                            index: j,
                          )
                      ]),
          ),
        );
      },
    );
  }
}
