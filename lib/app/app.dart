import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/widgets/cards/playing_card.dart';
import 'package:open_freecell/app/widgets/completed_pile/completed_pile.dart';
import 'package:open_freecell/app/widgets/freecell/freecell.dart';
import 'package:open_freecell/app/widgets/modals/win_modal.dart';
import 'package:open_freecell/app/widgets/options/options.dart';
import 'package:open_freecell/app/widgets/play_area/play_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/felt_background.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CompletedCardsBar(),
              Flexible(
                child: Column(
                  children: [
                    OptionsBar(),
                    PlayArea(),
                  ],
                ),
              ),
              FreeCellBar(),
            ],
          ),
          if (appState.gameIsWon)
            Container(
              color: Colors.black.withOpacity(.90),
            ).animate().fadeIn(duration: 800.ms),
          if (appState.gameIsWon) WinModal()
        ],
      ),
    ));
  }
}
