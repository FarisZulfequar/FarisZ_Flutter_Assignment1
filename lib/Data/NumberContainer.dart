class NumberContainer {
  static final List<int> _numberList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  NumberContainer();

  List<int> getNumberList() {
      return _numberList;
  }

  void increaseGeneratedNumberTimes(int generatedNum) {
    switch (generatedNum) {
      case 1:
        _numberList[0] += 1;
        break;
      case 2:
        _numberList[1] += 1;
        break;
      case 3:
        _numberList[2] += 1;
        break;
      case 4:
        _numberList[3] += 1;
        break;
      case 5:
        _numberList[4] += 1;
        break;
      case 6:
        _numberList[5] += 1;
        break;
      case 7:
        _numberList[6] += 1;
        break;
      case 8:
        _numberList[7] += 1;
        break;
      default:
        _numberList[8] += 1;
        break;
    }
  }
}
