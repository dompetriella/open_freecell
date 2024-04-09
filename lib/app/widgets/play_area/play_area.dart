import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:truly_freecell/app/app.dart';
import 'package:truly_freecell/app/models/app_state_data.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

import '../../models/card_data.dart';

class PlayArea extends StatelessWidget {
  const PlayArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < GLOBAL_playColumnNumber; i++)
                PlayColumn(columnIndex: i)
            ],
          ),
        ));
  }
}

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
        appStateActions.addCardsToPlayColumn(details.data, columnIndex);
      },
      builder: (context, candidateData, rejectedData) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            color: isHovering.value
                ? Colors.lightBlue
                : Colors.white.withOpacity(columnIndex * .1),
            child: Column(
              children: appState.playColumns[columnIndex].isEmpty
                  ? [
                      SizedBox(
                        width: GLOBAL_cardWidth,
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
                    ],
            ),
          ),
        );
      },
    );
  }
}
