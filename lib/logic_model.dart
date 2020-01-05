import 'dart:async';

import 'package:flutter/material.dart';

class LogicModel extends ChangeNotifier {
  static List<int> _board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  static final int _x = 1;
  static final int _o = 2;
  int _totalScoreX = 0;
  int _totalScoreO = 0;
  int _currentPlayer = 1;
  int _round = 0;
  int _winner = 0;
  //пересоздать проект изменив название
  get winner => _winner;
  get board => _board;
  get currentPlayer => currentPlayer;
  get totalScoreX => _totalScoreX;
  get totalScoreO => _totalScoreO;

  void move(int cellNumber) {
    _board[cellNumber] = _currentPlayer;
    _checkEndGame();
    _round++;
    notifyListeners();
  }

  void cellTaped(int cellNumber) {
    if (_board[cellNumber] == 0) {
      move(cellNumber);
    }
    return;
  }

  void resetGame() {
    _totalScoreX = 0;
    _totalScoreO = 0;
    _newRound();
    notifyListeners();
  }

  int checkWinner(int currentPlayer) {
    if (currentPlayer == _x)
      return 1;
    else
      return 2;
  }

  void _victoryEvent() {
    _addScore(_currentPlayer);
    _winner = checkWinner(_currentPlayer);
    notifyListeners();
    Timer(Duration(milliseconds: 500), () => _winner = 0);
    _newRound();
    notifyListeners();
  }

  void _tieEvent() {
    _newRound();
    notifyListeners();
  }

  void _checkEndGame() {
    if (_checkVictory(_currentPlayer)) {
      _victoryEvent();
      return;
    } else if (_round == 8) {
      _tieEvent();
      return;
    } else
      _changePlayer();
  }

  void _changePlayer() {
    if (_currentPlayer == _x) {
      _currentPlayer = _o;
    } else {
      _currentPlayer = _x;
    }
  }

  bool _checkVictory(int _currentPlayer) {
    if (_winning(_board, _currentPlayer)) {
      return true;
    }
    return false;
  }

  void _addScore(int _currentPlayer) {
    if (_currentPlayer == _x) {
      _totalScoreX++;
    } else
      _totalScoreO++;
  }

  bool _winning(List<int> _board, int player) {
    if ((_board[0] == player && _board[1] == player && _board[2] == player) ||
        (_board[3] == player && _board[4] == player && _board[5] == player) ||
        (_board[6] == player && _board[7] == player && _board[8] == player) ||
        (_board[0] == player && _board[3] == player && _board[6] == player) ||
        (_board[1] == player && _board[4] == player && _board[7] == player) ||
        (_board[2] == player && _board[5] == player && _board[8] == player) ||
        (_board[0] == player && _board[4] == player && _board[8] == player) ||
        (_board[2] == player && _board[4] == player && _board[6] == player)) {
      return true;
    } else {
      return false;
    }
  }

  _newRound() {
    _board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    _currentPlayer = 1;
    _round = 0;
  }
}
