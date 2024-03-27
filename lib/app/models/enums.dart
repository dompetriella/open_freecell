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
