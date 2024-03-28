import 'package:flutter/material.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/widgets/card_slot.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
              for (int j = 0; j < 8; j++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      for (int i = 1; i < 5; i++)
                        PlayingCard(
                            cardData: CardData(
                                id: i,
                                suit: Suits.clubs,
                                value: i,
                                isExpanded: false))
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
