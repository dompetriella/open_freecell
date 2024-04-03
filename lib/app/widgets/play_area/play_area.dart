import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

class PlayArea extends ConsumerWidget {
  const PlayArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gameState = ref.watch(appStateProvider);

    return Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < gameState.playColumns.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      for (int j = 0; j < gameState.playColumns[i].length; j++)
                        PlayingCard(
                          cardData: gameState.playColumns[i][j],
                          isExpanded: gameState.playColumns[i].length - 1 == j,
                          index: j,
                        )
                    ],
                  ),
                )
            ],
          ),
        ));
  }
}
