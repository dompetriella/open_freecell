import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';

class FreecellSlot extends HookConsumerWidget {
  final int freecellIndex;
  const FreecellSlot({super.key, required this.freecellIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    var appStateActions = ref.watch(appStateProvider.notifier);
    var isHovering = useState(false);
    var contents = appState.playColumns[freecellIndex];

    return DragTarget(
      onAcceptWithDetails: (DragTargetDetails<List<CardData>> details) {
        appStateActions.addCardToFreecell(details.data.first, freecellIndex);
      },
      onWillAcceptWithDetails: (DragTargetDetails<List<CardData>> details) {
        if (details.data.length > 1 || contents.isNotEmpty) {
          return false;
        }
        isHovering.value = true;
        return true;
      },
      onLeave: (data) {
        isHovering.value = false;
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: GLOBAL_cardHeight,
          width: GLOBAL_cardWidth * 1.1,
          decoration: BoxDecoration(
              color: isHovering.value
                  ? Colors.white.withOpacity(.25)
                  : Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 3)),
          child: contents.isNotEmpty
              ? PlayingCard(
                  cardData: contents.first,
                  column: PlayColumns.freecell.index,
                )
              : null,
        );
      },
    );
  }
}
