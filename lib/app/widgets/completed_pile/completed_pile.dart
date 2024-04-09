import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/globals/globals.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/completed_pile/completed_card_slot.dart';

class CompletedCardsBar extends ConsumerWidget {
  const CompletedCardsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    return Container(
      color: Colors.white.withOpacity(.1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GLOBAL_cardWidth / 3),
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
      ),
    );
  }
}
