import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/globals/globals.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/freecell/freecell_slot.dart';

class FreeCellBar extends ConsumerWidget {
  const FreeCellBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    return Container(
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GLOBAL_cardWidth / 3),
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
      ),
    );
  }
}
