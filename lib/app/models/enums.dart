import 'package:flutter/material.dart';

enum Suits {
  hearts('assets/heart.svg', Colors.red),
  clubs('assets/club.svg', Colors.black),
  diamonds('assets/diamond.svg', Colors.red),
  spades('assets/spade.svg', Colors.black);

  final String image;
  final Color color;
  const Suits(this.image, this.color);
}

enum PlayColumns {
  playColumn1,
  playColumn2,
  playColumn3,
  playColumn4,
  playColumn5,
  playColumn6,
  playColumn7,
  playColumn8,
  freecell,
  completedPile
}
