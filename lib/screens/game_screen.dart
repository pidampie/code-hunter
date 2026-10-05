import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/code_hunter_game.dart';
import '../game/game_elements.dart';
// IMPORT FILE LEVEL SCREEN UNTUK MENGAKSES VARIABEL GLOBAL
import 'level_screen.dart';

class GameScreen extends StatefulWidget {
  final String levelFile;
  final int levelIndex;

  const GameScreen({
    super.key,
    required this.levelFile,
    required this.levelIndex,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late CodeHunterGame _game;

  // 100 Soal Tersedia
  final List<List<Map<String, dynamic>>> _allQuestions = [
    // Level 1
    [
      {
        'code': 'let x = 5;\nconsole.log(x);',
        'options': ['A. 5', 'B. x', 'C. undefined', 'D. Error'],
        'correct': 'A. 5',
      },
      {
        'code': 'const nama = "Rudi";\nnama = "Budi";',
        'options': ['A. Rudi', 'B. Budi', 'C. Error', 'D. null'],
        'correct': 'C. Error',
      },
      {
        'code': 'var a;\nconsole.log(a);',
        'options': ['A. 0', 'B. undefined', 'C. null', 'D. Error'],
        'correct': 'B. undefined',
      },
      {
        'code': 'let x = "10";\nconsole.log(typeof x);',
        'options': ['A. int', 'B. number', 'C. string', 'D. boolean'],
        'correct': 'C. string',
      },
      {
        'code': 'let b = true;\nconsole.log(b);',
        'options': ['A. 1', 'B. true', 'C. "true"', 'D. yes'],
        'correct': 'B. true',
      },
    ],
    // Level 2
    [
      {
        'code': 'let x = 10 + 5;\nconsole.log(x);',
        'options': ['A. 105', 'B. 15', 'C. 50', 'D. Error'],
        'correct': 'B. 15',
      },
      {
        'code': 'let y = 10 % 3;\nconsole.log(y);',
        'options': ['A. 3.33', 'B. 3', 'C. 1', 'D. 0'],
        'correct': 'C. 1',
      },
      {
        'code': 'let z = 5 * 2 + 3;\nconsole.log(z);',
        'options': ['A. 25', 'B. 13', 'C. 10', 'D. 15'],
        'correct': 'B. 13',
      },
      {
        'code': 'let a = 2 ** 3;\nconsole.log(a);',
        'options': ['A. 6', 'B. 9', 'C. 8', 'D. 5'],
        'correct': 'C. 8',
      },
      {
        'code': 'let m = 10;\nm++;\nconsole.log(m);',
        'options': ['A. 10', 'B. 11', 'C. 12', 'D. 9'],
        'correct': 'B. 11',
      },
    ],
    // Level 3
    [
      {
        'code': 'console.log(5 > 3);',
        'options': ['A. true', 'B. false', 'C. 1', 'D. 0'],
        'correct': 'A. true',
      },
      {
        'code': 'console.log(10 == "10");',
        'options': ['A. true', 'B. false', 'C. Error', 'D. null'],
        'correct': 'A. true',
      },
      {
        'code': 'console.log(10 === "10");',
        'options': ['A. true', 'B. false', 'C. Error', 'D. NaN'],
        'correct': 'B. false',
      },
      {
        'code': 'console.log(8 != 8);',
        'options': ['A. true', 'B. false', 'C. undefined', 'D. Error'],
        'correct': 'B. false',
      },
      {
        'code': 'console.log(5 >= 5);',
        'options': ['A. true', 'B. false', 'C. Error', 'D. NaN'],
        'correct': 'A. true',
      },
    ],
    // Level 4
    [
      {
        'code': 'console.log(true && false);',
        'options': ['A. true', 'B. false', 'C. 1', 'D. 0'],
        'correct': 'B. false',
      },
      {
        'code': 'console.log(true || false);',
        'options': ['A. true', 'B. false', 'C. Error', 'D. null'],
        'correct': 'A. true',
      },
      {
        'code': 'console.log(!true);',
        'options': ['A. true', 'B. false', 'C. undefined', 'D. NaN'],
        'correct': 'B. false',
      },
      {
        'code': 'console.log((5 > 3) && (2 < 4));',
        'options': ['A. true', 'B. false', 'C. Error', 'D. null'],
        'correct': 'A. true',
      },
      {
        'code': 'console.log(!(10 == 10));',
        'options': ['A. true', 'B. false', 'C. Error', 'D. undefined'],
        'correct': 'B. false',
      },
    ],
    // Level 5
    [
      {
        'code': 'if (5 > 3) { console.log("A"); }',
        'options': ['A. A', 'B. B', 'C. null', 'D. Kosong'],
        'correct': 'A. A',
      },
      {
        'code': 'if (false) log("A"); else log("B");',
        'options': ['A. A', 'B. B', 'C. A B', 'D. Error'],
        'correct': 'B. B',
      },
      {
        'code': 'let x = 10;\nif (x == "10") log("Y");',
        'options': ['A. Y', 'B. N', 'C. Error', 'D. Kosong'],
        'correct': 'A. Y',
      },
      {
        'code': 'let a = 5;\nif (a > 10) log("X"); else log("Y");',
        'options': ['A. X', 'B. Y', 'C. X Y', 'D. Error'],
        'correct': 'B. Y',
      },
      {
        'code': 'if (!false) log("Go");',
        'options': ['A. Go', 'B. Stop', 'C. Error', 'D. Kosong'],
        'correct': 'A. Go',
      },
    ],
    // Level 6
    [
      {
        'code': 'let x=2;\nif(x==1) log("A");\nelse if(x==2) log("B");',
        'options': ['A. A', 'B. B', 'C. AB', 'D. Error'],
        'correct': 'B. B',
      },
      {
        'code': 'let a=5;\nif(a>10) log(1); else if(a>3) log(2);',
        'options': ['A. 1', 'B. 2', 'C. 3', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code': 'let v=100;\nif(v>50) log("L"); else if(v>80) log("A");',
        'options': ['A. A', 'B. L', 'C. AL', 'D. Kosong'],
        'correct': 'B. L',
      },
      {
        'code': 'let c=0;\nif(c) log("A"); else if(!c) log("B");',
        'options': ['A. A', 'B. B', 'C. Kosong', 'D. Error'],
        'correct': 'B. B',
      },
      {
        'code': 'if(1===1) log("X"); else if(2==2) log("Y");',
        'options': ['A. X', 'B. Y', 'C. XY', 'D. Error'],
        'correct': 'A. X',
      },
    ],
    // Level 7
    [
      {
        'code': 'let k="A";\nswitch(k){\ncase "A": log(1); break;\ndefault: log(2);\n}',
        'options': ['A. 1', 'B. 2', 'C. 3', 'D. Error'],
        'correct': 'A. 1',
      },
      {
        'code':
            'let v=2;\nswitch(v){\ncase 1: log("X");\ndefault: log("Y");\n}',
        'options': ['A. X', 'B. Y', 'C. XY', 'D. Kosong'],
        'correct': 'B. Y',
      },
      {
        'code': 'switch("B"){\ncase "A": log(1); break;\ncase "B": log(2); break;\n}',
        'options': ['A. 1', 'B. 2', 'C. 3', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code':
            'switch(10){\ncase "10": log("T"); break;\ndefault: log("F");\n}',
        'options': ['A. T', 'B. F', 'C. Error', 'D. NaN'],
        'correct': 'B. F',
      },
      {
        'code': 'let x=0;\nswitch(x){\ncase false: log("F"); break;\ndefault: log("D");\n}',
        'options': ['A. F', 'B. D', 'C. FD', 'D. Error'],
        'correct': 'B. D',
      },
    ],
    // Level 8
    [
      {
        'code': 'for(let i=0; i<3; i++){\n log(i);\n}',
        'options': ['A. 0 1 2', 'B. 1 2 3', 'C. 0 1 2 3', 'D. 1 2'],
        'correct': 'A. 0 1 2',
      },
      {
        'code': 'let s=0;\nfor(let i=1; i<=3; i++) s+=i;\nlog(s);',
        'options': ['A. 3', 'B. 5', 'C. 6', 'D. 9'],
        'correct': 'C. 6',
      },
      {
        'code': 'for(let i=3; i>0; i--){\n log(i);\n}',
        'options': ['A. 3 2 1', 'B. 3 2 1 0', 'C. 2 1 0', 'D. 1 2 3'],
        'correct': 'A. 3 2 1',
      },
      {
        'code': 'for(let i=0; i<5; i+=2){\n log(i);\n}',
        'options': ['A. 0 1 2', 'B. 0 2 4', 'C. 2 4', 'D. 0 2 4 6'],
        'correct': 'B. 0 2 4',
      },
      {
        'code': 'let x=0;\nfor(let i=0; i<10; i++){ x++; break; }',
        'options': ['A. 1', 'B. 10', 'C. 0', 'D. Error'],
        'correct': 'A. 1',
      },
    ],
    // Level 9
    [
      {
        'code': 'let i=0;\nwhile(i<2){\n log(i); i++;\n}',
        'options': ['A. 0 1', 'B. 1 2', 'C. 0 1 2', 'D. 0'],
        'correct': 'A. 0 1',
      },
      {
        'code': 'let a=3;\nwhile(a>1){\n log(a); a--;\n}',
        'options': ['A. 3 2 1', 'B. 3 2', 'C. 2 1', 'D. 3'],
        'correct': 'B. 3 2',
      },
      {
        'code': 'let x=0;\ndo { x++; } while(x<0);\nlog(x);',
        'options': ['A. 0', 'B. 1', 'C. -1', 'D. Error'],
        'correct': 'B. 1',
      },
      {
        'code': 'let k=0;\nwhile(false){\n k++;\n}\nlog(k);',
        'options': ['A. 0', 'B. 1', 'C. Infinity', 'D. Error'],
        'correct': 'A. 0',
      },
      {
        'code': 'let i=5;\nwhile(i<5){\n log(i);\n}',
        'options': ['A. 5', 'B. Kosong', 'C. Error', 'D. Infinity'],
        'correct': 'B. Kosong',
      },
    ],
    // Level 10
    [
      {
        'code': 'let a = [10, 20, 30];\nlog(a[0]);',
        'options': ['A. 10', 'B. 20', 'C. 30', 'D. undefined'],
        'correct': 'A. 10',
      },
      {
        'code': 'let x = ["A", "B", "C"];\nlog(x[2]);',
        'options': ['A. A', 'B. B', 'C. C', 'D. Error'],
        'correct': 'C. C',
      },
      {
        'code': 'let arr = [5, 10];\nlog(arr.length);',
        'options': ['A. 1', 'B. 2', 'C. 3', 'D. 0'],
        'correct': 'B. 2',
      },
      {
        'code': 'let z = [1, 2];\nz[0] = 9;\nlog(z[0]);',
        'options': ['A. 1', 'B. 2', 'C. 9', 'D. Error'],
        'correct': 'C. 9',
      },
      {
        'code': 'let a = [10, 20];\nlog(a[5]);',
        'options': ['A. Error', 'B. undefined', 'C. null', 'D. 0'],
        'correct': 'B. undefined',
      },
    ],
    // Level 11
    [
      {
        'code': 'let a = [1];\na.push(2);\nlog(a);',
        'options': ['A. [1]', 'B. [2]', 'C. [1, 2]', 'D. Error'],
        'correct': 'C. [1, 2]',
      },
      {
        'code': 'let a = [1, 2];\na.pop();\nlog(a);',
        'options': ['A. [1]', 'B. [2]', 'C. []', 'D. Error'],
        'correct': 'A. [1]',
      },
      {
        'code': 'let x = [1, 2];\nx.unshift(0);\nlog(x[0]);',
        'options': ['A. 1', 'B. 2', 'C. 0', 'D. Error'],
        'correct': 'C. 0',
      },
      {
        'code': 'let z = [1, 2];\nz.shift();\nlog(z);',
        'options': ['A. [1]', 'B. [2]', 'C. []', 'D. Error'],
        'correct': 'B. [2]',
      },
      {
        'code': 'let a = [1, 2];\nlog(a.indexOf(2));',
        'options': ['A. 0', 'B. 1', 'C. 2', 'D. -1'],
        'correct': 'B. 1',
      },
    ],
    // Level 12
    [
      {
        'code': 'function s() { return 5; }\nlog(s());',
        'options': ['A. 5', 'B. s', 'C. undefined', 'D. Error'],
        'correct': 'A. 5',
      },
      {
        'code': 'function p() { log("A"); }\np();',
        'options': ['A. A', 'B. undefined', 'C. Error', 'D. Kosong'],
        'correct': 'A. A',
      },
      {
        'code': 'function x() { return; }\nlog(x());',
        'options': ['A. null', 'B. undefined', 'C. 0', 'D. Error'],
        'correct': 'B. undefined',
      },
      {
        'code': 'let f = function() { return 2; };\nlog(f());',
        'options': ['A. 2', 'B. f', 'C. undefined', 'D. Error'],
        'correct': 'A. 2',
      },
      {
        'code': 'function a() { return 1+1; }\nlog(a);',
        'options': ['A. 2', 'B. [Function]', 'C. undefined', 'D. Error'],
        'correct': 'B. [Function]',
      },
    ],
    // Level 13
    [
      {
        'code': 'function t(a, b) { return a+b; }\nlog(t(2,3));',
        'options': ['A. 23', 'B. 5', 'C. NaN', 'D. Error'],
        'correct': 'B. 5',
      },
      {
        'code': 'function h(n) { return "Hai "+n; }\nlog(h("Al"));',
        'options': ['A. Hai Al', 'B. Hai n', 'C. Error', 'D. Hai'],
        'correct': 'A. Hai Al',
      },
      {
        'code': 'function m(x) { return x*2; }\nlog(m(4));',
        'options': ['A. 8', 'B. 6', 'C. 2', 'D. Error'],
        'correct': 'A. 8',
      },
      {
        'code': 'function a(x,y=2){ return x+y; }\nlog(a(5));',
        'options': ['A. 5', 'B. 7', 'C. NaN', 'D. Error'],
        'correct': 'B. 7',
      },
      {
        'code': 'function k(a) { return a; }\nlog(k());',
        'options': ['A. null', 'B. 0', 'C. undefined', 'D. Error'],
        'correct': 'C. undefined',
      },
    ],
    // Level 14
    [
      {
        'code': 'const f = () => 5;\nlog(f());',
        'options': ['A. 5', 'B. undefined', 'C. Error', 'D. null'],
        'correct': 'A. 5',
      },
      {
        'code': 'const k = (x) => x*2;\nlog(k(3));',
        'options': ['A. 6', 'B. 5', 'C. Error', 'D. undefined'],
        'correct': 'A. 6',
      },
      {
        'code': 'const a = (x,y) => x+y;\nlog(a(1,2));',
        'options': ['A. 3', 'B. 12', 'C. Error', 'D. undefined'],
        'correct': 'A. 3',
      },
      {
        'code': 'const n = () => { return "X"; };\nlog(n());',
        'options': ['A. X', 'B. return X', 'C. Error', 'D. undefined'],
        'correct': 'A. X',
      },
      {
        'code': 'const c = x => x;\nlog(c("Y"));',
        'options': ['A. x', 'B. Y', 'C. Error', 'D. undefined'],
        'correct': 'B. Y',
      },
    ],
    // Level 15
    [
      {
        'code': 'let o = {a: 1};\nlog(o.a);',
        'options': ['A. 1', 'B. a', 'C. undefined', 'D. Error'],
        'correct': 'A. 1',
      },
      {
        'code': 'let u = {nama: "Z"};\nlog(u["nama"]);',
        'options': ['A. nama', 'B. Z', 'C. undefined', 'D. Error'],
        'correct': 'B. Z',
      },
      {
        'code': 'let d = {x: 5};\nd.x = 9;\nlog(d.x);',
        'options': ['A. 5', 'B. 9', 'C. undefined', 'D. Error'],
        'correct': 'B. 9',
      },
      {
        'code': 'let k = {};\nk.id = 1;\nlog(k.id);',
        'options': ['A. null', 'B. 1', 'C. undefined', 'D. Error'],
        'correct': 'B. 1',
      },
      {
        'code': 'let p = {a: 1};\nlog(p.b);',
        'options': ['A. null', 'B. 0', 'C. undefined', 'D. Error'],
        'correct': 'C. undefined',
      },
    ],
    // Level 16
    [
      {
        'code': 'let o = { x:1, g:function(){return 2;} };\nlog(o.g());',
        'options': ['A. 1', 'B. 2', 'C. undefined', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code': 'let u = { n:"A", s(){return this.n;} };\nlog(u.s());',
        'options': ['A. A', 'B. n', 'C. undefined', 'D. Error'],
        'correct': 'A. A',
      },
      {
        'code': 'let c = { v:5, ad(){this.v++;} };\nc.ad(); log(c.v);',
        'options': ['A. 5', 'B. 6', 'C. undefined', 'D. Error'],
        'correct': 'B. 6',
      },
      {
        'code': 'let m = { a:1, b:()=>this.a };\nlog(m.b());',
        'options': ['A. 1', 'B. undefined', 'C. Error', 'D. null'],
        'correct': 'B. undefined',
      },
      {
        'code': 'let o = { f(){return "O";} };\nlog(o["f"]());',
        'options': ['A. f', 'B. O', 'C. undefined', 'D. Error'],
        'correct': 'B. O',
      },
    ],
    // Level 17
    [
      {
        'code': 'let a = [{id:1}, {id:2}];\nlog(a[1].id);',
        'options': ['A. 1', 'B. 2', 'C. undefined', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code': 'let d = [{x:"A"}];\nlog(d[0].x);',
        'options': ['A. A', 'B. x', 'C. undefined', 'D. Error'],
        'correct': 'A. A',
      },
      {
        'code': 'let a = [{n:"A"}];\na.push({n:"B"});\nlog(a.length);',
        'options': ['A. 1', 'B. 2', 'C. 3', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code': 'let x = [{v:1}];\nx[0].v = 5;\nlog(x[0].v);',
        'options': ['A. 1', 'B. 5', 'C. undefined', 'D. Error'],
        'correct': 'B. 5',
      },
      {
        'code': 'let arr = [{a:1}];\nlog(arr[1]);',
        'options': ['A. 1', 'B. null', 'C. undefined', 'D. Error'],
        'correct': 'C. undefined',
      },
    ],
    // Level 18
    [
      {
        'code': 'let s = "Halo";\nlog(s.length);',
        'options': ['A. 3', 'B. 4', 'C. 5', 'D. Error'],
        'correct': 'B. 4',
      },
      {
        'code': 'let a = "ab";\nlog(a.toUpperCase());',
        'options': ['A. AB', 'B. ab', 'C. Ab', 'D. Error'],
        'correct': 'A. AB',
      },
      {
        'code': 'let x = "A,B";\nlog(x.split(",")[0]);',
        'options': ['A. A,B', 'B. A', 'C. B', 'D. Error'],
        'correct': 'B. A',
      },
      {
        'code': 'let k = "Code";\nlog(k.charAt(1));',
        'options': ['A. C', 'B. o', 'C. d', 'D. e'],
        'correct': 'B. o',
      },
      {
        'code': 'let w = "  hi  ";\nlog(w.trim().length);',
        'options': ['A. 6', 'B. 4', 'C. 2', 'D. Error'],
        'correct': 'C. 2',
      },
    ],
    // Level 19
    [
      {
        'code': 'try { throw "Err"; } catch(e) { log(e); }',
        'options': ['A. Err', 'B. undefined', 'C. Error', 'D. Kosong'],
        'correct': 'A. Err',
      },
      {
        'code': 'try { log("A"); } catch(e) { log("B"); }',
        'options': ['A. A', 'B. B', 'C. A B', 'D. Error'],
        'correct': 'A. A',
      },
      {
        'code': 'try { log(a); } catch(e) { log("C"); }',
        'options': ['A. undefined', 'B. a', 'C. C', 'D. Error'],
        'correct': 'C. C',
      },
      {
        'code': 'try { throw 1; } catch(e) { log(e+1); }',
        'options': ['A. 1', 'B. 2', 'C. undefined', 'D. Error'],
        'correct': 'B. 2',
      },
      {
        'code': 'try { log("X"); } finally { log("Y"); }',
        'options': ['A. X', 'B. Y', 'C. X Y', 'D. Error'],
        'correct': 'C. X Y',
      },
    ],
    // Level 20
    [
      {
        'code': 'let x=0;\nfor(let i=1;i<4;i++) x+=i;\nlog(x);',
        'options': ['A. 3', 'B. 6', 'C. 4', 'D. 10'],
        'correct': 'B. 6',
      },
      {
        'code': 'let a=[1,2,3];\nlog(a.reduce((s,c)=>s+c,0));',
        'options': ['A. 3', 'B. 5', 'C. 6', 'D. Error'],
        'correct': 'C. 6',
      },
      {
        'code': 'let s="121";\nlog(s===s.split("").reverse().join(""));',
        'options': ['A. true', 'B. false', 'C. Error', 'D. null'],
        'correct': 'A. true',
      },
      {
        'code': 'let f = n => n<2 ? 1 : n*f(n-1);\nlog(f(3));',
        'options': ['A. 3', 'B. 6', 'C. 9', 'D. Error'],
        'correct': 'B. 6',
      },
      {
        'code': 'let a=[1,2];\nlet b=[...a,3];\nlog(b.length);',
        'options': ['A. 2', 'B. 3', 'C. 4', 'D. Error'],
        'correct': 'B. 3',
      },
    ],
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
    // Ambil soal berdasarkan level saat ini
    final levelQuestions = _allQuestions[widget.levelIndex];
    final q = levelQuestions[enemy.questionIndex % levelQuestions.length];

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
            'Kuis Level ${widget.levelIndex + 1} - Musuh #${enemy.questionIndex + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Apa output dari baris kode berikut?',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: Text(
                  q['code'],
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
        side: const BorderSide(color: Colors.black45, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        Navigator.pop(dialogCtx);

        if (isCorrect) {
          enemy.onDefeated();
          _game.addScore(100);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Jawaban Benar! (+100)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xFF10B981),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          _game.player.takeDamage();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Jawaban Salah! Nyawa -1',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xFFEF4444),
              duration: Duration(seconds: 2),
            ),
          );
        }

        _game.resumeEngine();
      },
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
      ),
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E2430),
        shape: Border.all(color: Colors.redAccent, width: 4),
        title: const Text(
          'GAME OVER',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        content: const Text(
          'Nyawamu telah habis. Ingin mencoba kembali?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB800),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _initGame();
              });
            },
            child: const Text(
              'COBA LAGI',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text(
              'KELUAR',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showWinDialog() {
    // LOGIKA UNLOCK LEVEL:
    // Jika pemain berhasil menyelesaikan level ini dan level selanjutnya masih terkunci, buka level tersebut!
    if (widget.levelIndex + 1 == globalUnlockedLevel &&
        globalUnlockedLevel < 20) {
      globalUnlockedLevel++;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFFEF3C7),
        shape: Border.all(color: const Color(0xFFD97706), width: 4),
        title: const Text(
          'LEVEL SELESAI!',
          style: TextStyle(
            color: Color(0xFFD97706),
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        content: Text(
          'Luar biasa! Kamu berhasil menaklukkan Level ${widget.levelIndex + 1}.\nLevel selanjutnya sekarang terbuka!',
          style: const TextStyle(
            color: Color(0xFF92400E),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981), // Tombol hijau sukses
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context); // Kembali ke peta level
            },
            child: const Text(
              'LANJUT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
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
