import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/card_slot.dart';

class CompletedCardsBar extends ConsumerWidget {
  const CompletedCardsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    return Flexible(
        child: Container(
      color: Colors.white.withOpacity(.1),
      constraints: BoxConstraints(minWidth: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < appState.completedPiles.length; i++)
              CompletedCardSlot(
                completedPileIndex: i,
                suit: Suits.values[i],
              )
          ],
        ),
      ),
    ));
  }
}
