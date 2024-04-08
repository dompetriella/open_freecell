import 'package:flutter/material.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/card_slot.dart';
import 'package:truly_freecell/app/widgets/completed_pile/completed_pile.dart';
import 'package:truly_freecell/app/widgets/freecell/freecell.dart';
import 'package:truly_freecell/app/widgets/options/options.dart';
import 'package:truly_freecell/app/widgets/play_area/play_area.dart';
import 'package:truly_freecell/app/widgets/playing_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double GLOBAL_cardHeight = 135;
double GLOBAL_cardWidth = 100;
int GLOBAL_playColumnNumber = 8;

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
