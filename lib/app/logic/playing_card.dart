import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/models/card_data.dart';
import 'package:truly_freecell/app/models/enums.dart';
import 'package:truly_freecell/app/state/app_state.dart';

String setCardName(CardData cardData) {
  if (cardData.value > 1 && cardData.value < 11) {
    return cardData.value.toString();
  } else if (cardData.value == 11) {
    return 'J';
  } else if (cardData.value == 12) {
    return 'Q';
  } else if (cardData.value == 13) {
    return 'K';
  } else {
    return 'A';
  }
}

bool getExpandedStatus(WidgetRef ref, int column, CardData cardData) {
  if (column == PlayColumns.freecell.index ||
      column == PlayColumns.completedPile.index) {
    return true;
  }

  var appState = ref.watch(appStateProvider);
  int index = appState.playColumns[column]
      .indexWhere((element) => element.id == cardData.id);
  int columnLength = appState.playColumns[column].length - 1;
  if (index == columnLength) {
    return true;
  }
  return false;
}

List<CardData> getCardsAvailableToMove(CardData cardData, WidgetRef ref) {
  var appState = ref.watch(appStateProvider);

  int column = cardData.lastColumnIndex;
  if (column == PlayColumns.freecell.index ||
      column == PlayColumns.completedPile.index) {
    return [cardData];
  }
  int cardIndexInPlayColumn = appState.playColumns[column]
      .indexWhere((element) => element.id == cardData.id);

  // Check if card is found in playColumns
  if (cardIndexInPlayColumn == -1) {
    return [cardData];
  }

  List<CardData> availableCards = [];

  for (var i = cardIndexInPlayColumn;
      i < appState.playColumns[column].length;
      i++) {
    availableCards.add(appState.playColumns[column][i]);
  }
  return availableCards;
}

bool isCardDraggable(WidgetRef ref, int? index, int column, bool isLastCard) {
  var appState = ref.watch(appStateProvider);

  // completed cards can't move
  if (column == PlayColumns.completedPile.index) {
    return false;
  }
  // freecell cards can always be dragged
  if (column >= PlayColumns.freecell.index &&
      column <= PlayColumns.freecell4.index) {
    return true;
  }

  if (isLastCard) {
    return true;
  }

  bool cardStackViabilityCheck = true;
  var currentColumn = appState.playColumns[column];

  for (var i = index!; i < currentColumn.length; i++) {
    int index1 = i;
    int index2 = i + 1;

    if (index2 <= currentColumn.length - 1) {
      if (currentColumn[index2].value != currentColumn[index1].value - 1 ||
          currentColumn[index2].suit.index % 2 ==
              currentColumn[index1].suit.index % 2) {
        cardStackViabilityCheck = false;
      }
    }
  }

  return cardStackViabilityCheck;
}

bool canCardBeCompleted(bool lastCard, CardData data, WidgetRef ref) {
  if (lastCard) {
    var appState = ref.watch(appStateProvider);
    List<CardData> completedPile = appState.completedPiles[data.suit.index];
    if (completedPile.isEmpty && data.value == 1) {
      return true;
    }
    if (completedPile.isEmpty && data.value != 1) {
      return false;
    }
    if (completedPile.last.value == data.value - 1) {
      return true;
    }
  }
  return false;
}
