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
        deck.add(CardData(id: id, suit: suit, value: i, lastColumnIndex: 0));
        id++;
      }
    }

    deck.shuffle();

    int column = 0;
    for (var i = 0; i < playColumnNumber; i++) {
      playColumns.add([]);
    }
    for (var card in deck) {
      playColumns[column].add(card.copyWith(lastColumnIndex: column));
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

  void addCardToFreecell(CardData cardData, int freecellIndex) {
    List<List<CardData>> newFreeCellState = List.from(state.freecells);

    List<CardData> newIndexedFreecell = [cardData];
    newFreeCellState[freecellIndex] = newIndexedFreecell;

    state = state.copyWith(freecells: newFreeCellState);
  }

  void removeCardFromPlayColumn(CardData cardData) {
    List<List<CardData>> newPlayColumnState = List.from(state.playColumns);
    for (var column in newPlayColumnState) {
      column.removeWhere((element) => element.id == cardData.id);
    }
  }

  void returnCardBackToPlayColumn(CardData cardData) {
    List<List<CardData>> newPlayColumnState = List.from(state.playColumns);
    newPlayColumnState[cardData.lastColumnIndex].add(cardData);
    state = state.copyWith(playColumns: newPlayColumnState);
  }
}
