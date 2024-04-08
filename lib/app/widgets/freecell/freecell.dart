import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/app.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/completed_card_slot.dart';
import 'package:truly_freecell/app/widgets/freecell/freecell_slot.dart';

class FreeCellBar extends ConsumerWidget {
  const FreeCellBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    return Flexible(
        child: Container(
      color: Colors.black.withOpacity(.1),
      constraints: BoxConstraints(minWidth: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = GLOBAL_playColumnNumber;
                i < appState.playColumns.length;
                i++)
              FreecellSlot(
                freecellIndex: i,
              ),
          ],
        ),
      ),
    ));
  }
}
