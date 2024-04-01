import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:truly_freecell/app/models/app_state_data.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';

part 'app_state.g.dart';

@riverpod
class AppState extends _$AppState {
  @override
  AppStateData build() {
    AppStateData initialDeck = dealInitialDeck();
    return initialDeck;
  }

  AppStateData dealInitialDeck() {
    List<CardData> deck = [];
    List<List<CardData>> playColumns = [];
    List<List<CardData>> freecells = [[], [], [], []];
    List<List<CardData>> completedPiles = [[], [], [], []];
    int playColumnNumber = 8;
    int id = 0;
    for (var suit in Suits.values) {
      for (var i = 1; i < 14; i++) {
        deck.add(CardData(id: id, suit: suit, value: i));
        id++;
      }
    }

    deck.shuffle();

    int column = 0;
    for (var i = 0; i < playColumnNumber; i++) {
      playColumns.add([]);
    }
    for (var card in deck) {
      playColumns[column].add(card);
      if (column < playColumnNumber - 1) {
        column++;
      } else {
        column = 0;
      }
    }

    for (var columns in playColumns) {
      columns.last = columns.last.copyWith(isExpanded: true);
    }

    return AppStateData(
        freecells: freecells,
        completedPiles: completedPiles,
        playColumns: playColumns);
  }

  // void decreaseItemInCart({required SaleItem? itemToDecrease}) {
  //   state = state.update(
  //     itemToDecrease,
  //     (value) => value - 1,
  //   );
}
