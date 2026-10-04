import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/code_hunter_game.dart';
import '../game/game_elements.dart';

class GameScreen extends StatefulWidget {
  final String levelFile;

  const GameScreen({super.key, required this.levelFile});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late CodeHunterGame _game;

  // Daftar 5 Soal Pemrograman
  final List<Map<String, dynamic>> _questions = [
    {
      'code': 'let a = 10;\nlet b = 5;\nlet c = a + b * 2;\nconsole.log(c);',
      'options': ['A. 30', 'B. 20', 'C. 25', 'D. 15'],
      'correct': 'B. 20',
    },
    {
      'code': 'let nilai = 80;\nif (nilai >= 75) {\n  console.log("LULUS");\n} else {\n  console.log("GAGAL");\n}',
      'options': ['A. GAGAL', 'B. LULUS', 'C. ERROR', 'D. null'],
      'correct': 'B. LULUS',
    },
    {
      'code': 'let angka = [10, 20, 30, 40];\nconsole.log(angka[2]);',
      'options': ['A. 10', 'B. 20', 'C. 30', 'D. 40'],
      'correct': 'C. 30',
    },
    {
      'code': 'let total = 0;\nfor (let i = 1; i <= 3; i++) {\n  total += i;\n}\nconsole.log(total);',
      'options': ['A. 3', 'B. 5', 'C. 6', 'D. 7'],
      'correct': 'C. 6',
    },
    {
      'code': 'let x = "10";\nlet y = 5;\nconsole.log(x + y);',
      'options': ['A. 15', 'B. "105"', 'C. NaN', 'D. undefined'],
      'correct': 'B. "105"',
    },
  ];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    _game = CodeHunterGame(
      levelName: widget.levelFile,
      onLevelCompleted: _showWinDialog,
      onQuizEncounter: _showQuizDialog,
      onGameOver: _showGameOverDialog,
    );
  }

  void _showQuizDialog(EnemyComponent enemy) {
    final q = _questions[enemy.questionIndex % _questions.length];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Tantangan Musuh #${enemy.questionIndex + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black87,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Perhatikan kode berikut. Apa outputnya?',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F6F9),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  q['code'],
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _buildAnswerBtn(
                      q['options'][0],
                      q['options'][0] == q['correct'],
                      enemy,
                      dialogCtx,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildAnswerBtn(
                      q['options'][1],
                      q['options'][1] == q['correct'],
                      enemy,
                      dialogCtx,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildAnswerBtn(
                      q['options'][2],
                      q['options'][2] == q['correct'],
                      enemy,
                      dialogCtx,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildAnswerBtn(
                      q['options'][3],
                      q['options'][3] == q['correct'],
                      enemy,
                      dialogCtx,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnswerBtn(
    String text,
    bool isCorrect,
    EnemyComponent enemy,
    BuildContext dialogCtx,
  ) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: const BorderSide(color: Colors.black45),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      onPressed: () {
        Navigator.pop(dialogCtx);
        if (isCorrect) {
          enemy.onDefeated();
          _game.addScore(100);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Jawaban Benar! Musuh terkalahkan (+100 Skor)'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          _game.loseLife();
          _game.player.respawn();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Jawaban Salah! Nyawa berkurang 1.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
        _game.resumeEngine();
      },
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E2430),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'GAME OVER',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Nyawamu telah habis. Ingin mencoba kembali?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB800),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _initGame(); // Muat ulang permainan
              });
            },
            child: const Text(
              'COBA LAGI',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text(
              'KELUAR',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF131924),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'LEVEL SELESAI!',
          style: TextStyle(
            color: Color(0xFFFFB800),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Luar biasa! 5 tantangan pemrograman berhasil kamu selesaikan.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB800),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text(
              'KEMBALI KE MENU',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GameWidget(game: _game));
  }
}
