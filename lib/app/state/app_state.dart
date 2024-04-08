import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:truly_freecell/app/app.dart';
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
    int id = 0;
    for (var suit in Suits.values) {
      for (var i = 1; i < 14; i++) {
        deck.add(CardData(id: id, suit: suit, value: i, lastColumnIndex: 0));
        id++;
      }
    }

    deck.shuffle();

    int column = 0;
    for (var i = 0; i < GLOBAL_playColumnNumber; i++) {
      playColumns.add([]);
    }
    for (var card in deck) {
      playColumns[column].add(card.copyWith(lastColumnIndex: column));
      if (column < GLOBAL_playColumnNumber - 1) {
        column++;
      } else {
        column = 0;
      }
    }

    for (var columns in playColumns) {
      columns.last = columns.last.copyWith(isExpanded: true);
    }

    playColumns = playColumns + freecells;

    return AppStateData(
        completedPiles: completedPiles, playColumns: playColumns);
  }

  void addCardToFreecell(CardData cardData, int freecellIndex) {
    List<List<CardData>> newFreeCellState = List.from(state.playColumns);

    CardData newCardData = cardData.copyWith(lastColumnIndex: freecellIndex);
    List<CardData> newIndexedFreecell = [newCardData];
    newFreeCellState[freecellIndex] = newIndexedFreecell;

    state = state.copyWith(playColumns: newFreeCellState);
  }

  void removeCardFromPlayColumn(CardData cardData) {
    List<List<CardData>> newPlayColumnState = List.from(state.playColumns);
    for (var column in newPlayColumnState) {
      column.removeWhere((element) => element.id == cardData.id);
    }
    state = state.copyWith(playColumns: newPlayColumnState);
  }

  void returnCardOnDragCancel(CardData cardData) {
    if (cardData.lastColumnIndex == PlayColumns.freecell.index) {}
    List<List<CardData>> newPlayColumnState = List.from(state.playColumns);
    newPlayColumnState[cardData.lastColumnIndex].add(cardData);
    state = state.copyWith(playColumns: newPlayColumnState);
  }
}
