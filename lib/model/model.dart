import 'dart:core';

enum ChipColor {
  red,
  yellow,
  white,
}

class Model {
  List<List<ChipColor>> colLists = [
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
  ];

  int findNextSlot(int col) {
    int index = 0;
    colLists[col].forEach((element) {
      if (element == ChipColor.white) {
        index++;
      }
    });
    return index;
  }
}
