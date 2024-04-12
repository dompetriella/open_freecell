import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';
import 'package:open_freecell/app/widgets/options/options.dart';

class WinModal extends ConsumerWidget {
  const WinModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    return Dialog(
      elevation: 5,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.white, width: 8)),
      child: Container(
        width: 800,
        height: 500,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You Win!',
              style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: RootPlayingCard(
                          isExpanded: true,
                          cardData: CardData(
                              id: i,
                              suit: Suits.values[i],
                              value: 13,
                              lastColumnIndex: 1),
                          cardName: 'K'),
                    )
                ]
                    .animate(delay: 800.ms, interval: 500.ms)
                    .slideY(curve: Curves.easeInOut, begin: -0.6)),
            SizedBox(
              height: 30,
            ),
            OptionsElevatedButton(
                    onPressed: () {
                      appStateActions.restartGame();
                    },
                    buttonText: 'Start New Game',
                    icon: Icons.style)
                .animate(delay: 3000.ms)
                .fadeIn(curve: Curves.easeInOut, duration: 800.ms)
          ],
        ),
      ),
    ).animate().slideY(curve: Curves.easeInOut, duration: 800.ms);
  }
}
