import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/models/app_state_data.dart';
import 'package:open_freecell/app/models/card_data.dart';
import 'package:open_freecell/app/models/enums.dart';

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

  List<List<CardData>> createDeepCopyOfCardList(List<List<CardData>> cards) {
    List<List<CardData>> newList = [];
    for (var column in cards) {
      List<CardData> newColumn = [];
      for (var card in column) {
        newColumn.add(card);
      }
      newList.add(newColumn);
    }
    return newList;
  }

  void setUndoState() {
    List<List<CardData>> oldPlayColumns =
        createDeepCopyOfCardList(state.playColumns);
    List<List<CardData>> oldCompletedPile =
        createDeepCopyOfCardList(state.completedPiles);
    state = state.copyWith(
        undoCompletedPiles: oldCompletedPile,
        undoPlayColumns: oldPlayColumns,
        undoEnabled: true);
  }

  void undoLastMove() {
    List<List<CardData>> oldPlayColumns =
        createDeepCopyOfCardList(state.undoPlayColumns);

    List<List<CardData>> oldCompletedPile =
        createDeepCopyOfCardList(state.undoCompletedPiles);
    state = state.copyWith(
        completedPiles: oldCompletedPile,
        playColumns: oldPlayColumns,
        undoEnabled: false);
  }

  restartGame() {
    state = dealInitialDeck();
    state = state.copyWith(gameIsWon: false);
  }

  winGame() {
    state = state.copyWith(gameIsWon: true);
  }

  void addCardToFreecell(CardData cardData, int freecellIndex) {
    List<List<CardData>> newFreeCellState =
        createDeepCopyOfCardList(state.playColumns);

    CardData newCardData = cardData.copyWith(lastColumnIndex: freecellIndex);
    List<CardData> newIndexedFreecell = [newCardData];
    newFreeCellState[freecellIndex] = newIndexedFreecell;

    state = state.copyWith(playColumns: newFreeCellState);
  }

  void addCardToCompletedPile(CardData cardData) {
    List<List<CardData>> newCompletedPileState =
        createDeepCopyOfCardList(state.completedPiles);

    newCompletedPileState[cardData.suit.index].add(
        cardData.copyWith(lastColumnIndex: PlayColumns.completedPile.index));
    state = state.copyWith(completedPiles: newCompletedPileState);
    var wonState = true;

    for (var completedPile in state.completedPiles) {
      if (completedPile.isNotEmpty) {
        if (completedPile.last.value != 13) {
          wonState = false;
        }
      }
    }
    state = state.copyWith(gameIsWon: wonState);
  }

  void addCardsToPlayColumn(List<CardData> cardData, int columnIndex) {
    List<List<CardData>> newPlayColumnState = [];

    for (List<CardData> column in state.playColumns) {
      newPlayColumnState.add(List.from(column));
    }

    List<CardData> newCardData =
        cardData.map((e) => e.copyWith(lastColumnIndex: columnIndex)).toList();

    newPlayColumnState[columnIndex].addAll(newCardData);
    state = state.copyWith(playColumns: newPlayColumnState);
  }

  void removeCardsFromPlayColumn(List<CardData> cardData) {
    setUndoState();
    List<List<CardData>> newPlayColumnState =
        createDeepCopyOfCardList(state.playColumns);
    List<int> removalIds = cardData.map((e) => e.id).toList();
    newPlayColumnState[cardData.first.lastColumnIndex]
        .removeWhere((element) => removalIds.contains(element.id));
    state = state.copyWith(playColumns: newPlayColumnState);
  }

  void returnCardsOnDragCancel(List<CardData> cardData) {
    List<List<CardData>> newPlayColumnState =
        createDeepCopyOfCardList(state.playColumns);
    newPlayColumnState[cardData.first.lastColumnIndex].addAll(cardData);
    state = state.copyWith(playColumns: newPlayColumnState);
  }
}
