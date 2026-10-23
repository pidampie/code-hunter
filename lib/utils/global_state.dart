class GlobalState {
  static final GlobalState instance = GlobalState._internal();
  GlobalState._internal();

  int playerCoins = 350; // Saldo awal koin pemain

  // Fungsi untuk memvalidasi dan mengurangi koin
  bool spendCoins(int amount) {
    if (playerCoins >= amount) {
      playerCoins -= amount;
      return true;
    }
    return false;
  }
}
