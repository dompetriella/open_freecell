import 'package:flutter/material.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/card_slot.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appStateProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionsBar(),
          CompletedCardsBar(),
          PlayArea(),
          FreeCellBar(),
        ],
      ),
    ));
  }
}

class FreeCellBar extends StatelessWidget {
  const FreeCellBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      color: Colors.black.withOpacity(.1),
      constraints: BoxConstraints(minWidth: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FreeCellSlot(),
            FreeCellSlot(),
            FreeCellSlot(),
            FreeCellSlot(),
          ],
        ),
      ),
    ));
  }
}

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
                        PlayingCard(cardData: gameState.playColumns[i][j])
                    ],
                  ),
                )
            ],
          ),
        ));
  }
}

class CompletedCardsBar extends StatelessWidget {
  const CompletedCardsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      color: Colors.white.withOpacity(.1),
      constraints: BoxConstraints(minWidth: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CompletedCardSlot(
              backgroundImage: Suits.hearts.image,
            ),
            CompletedCardSlot(
              backgroundImage: Suits.clubs.image,
            ),
            CompletedCardSlot(
              backgroundImage: Suits.diamonds.image,
            ),
            CompletedCardSlot(
              backgroundImage: Suits.spades.image,
            )
          ],
        ),
      ),
    ));
  }
}

class OptionsBar extends StatelessWidget {
  const OptionsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.white,
    );
  }
}
