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
    var gameState = ref.watch(appStateProvider);
    var gameStateActions = ref.watch(appStateProvider.notifier);
    var isHovering = useState(false);

    return DragTarget<List<CardData>>(
      onWillAcceptWithDetails: (details) {
        if (details.data.last.lastColumnIndex != columnIndex) {
          isHovering.value = true;
          return false;
        }

        return false;
      },
      onLeave: (data) {
        isHovering.value = false;
      },
      onAcceptWithDetails: (details) {
        isHovering.value = false;
      },
      builder: (context, candidateData, rejectedData) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            color: isHovering.value
                ? Colors.lightBlue
                : Colors.white.withOpacity(columnIndex * .1),
            child: Column(
              children: gameState.playColumns[columnIndex].isEmpty
                  ? [
                      SizedBox(
                        width: GLOBAL_cardWidth,
                      )
                    ]
                  : [
                      for (int j = 0;
                          j < gameState.playColumns[columnIndex].length;
                          j++)
                        PlayingCard(
                          cardData: gameState.playColumns[columnIndex][j],
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
