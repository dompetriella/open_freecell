import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:truly_freecell/app/app.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

class FreecellSlot extends HookConsumerWidget {
  final int freecellIndex;
  const FreecellSlot({super.key, required this.freecellIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var appStateActions = ref.watch(appStateProvider.notifier);
    var contents = appState.freecells[freecellIndex];

    return DragTarget(
      onAcceptWithDetails: (DragTargetDetails<List<CardData>> details) {
        if (details.data.length == 1) {
          print(details.data.first);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: GLOBAL_cardHeight,
          width: GLOBAL_cardWidth,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 3)),
          child: contents.isNotEmpty
              ? PlayingCard(
                  cardData: contents.first,
                  isExpanded: true,
                  inPlayColumn: false,
                )
              : null,
        );
      },
    );
  }
}
