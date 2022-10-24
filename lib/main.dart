
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';


int v = 0;
int m = 0;
var lst = [];
String value = "";
int total1 = 0;
int total2 = 0;

Scaffold scaffoldMaker(){
  return Scaffold(
    appBar: AppBar(
      title: const Text('Multiple Choice'),
    ),
    body: const MultipleChoice(),
  );
}

Scaffold scaffoldMaker2(){
  return Scaffold(
    appBar: AppBar(
      title: const Text('Analogue Clock'),
    ),
    body: const Analogue(),
  );
}



void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
 */
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ClockWiz Learning App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.orange,
        ),
      ),
      home: const Selections(),
    );
  }
}

class Selections extends StatefulWidget {
  const Selections({Key? key}) : super(key: key);

  @override
  _SelectionsState createState() => _SelectionsState();
}

class _SelectionsState extends State<Selections> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _buildSelections(),
    );
  }
  Widget _buildSelections(){
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: _selected,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Multiple Choice', style: _biggerFont,),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: _selected2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Analogue Clock', style: _biggerFont,),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
          ),
        ]
    );
  }
  void _selected(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context){
          return scaffoldMaker();
        },
      ),
    );
  }
  void _selected2(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context){
          return scaffoldMaker2();
        },
      ),
    );
  }


}

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({Key? key}) : super(key: key);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}
class _MultipleChoiceState extends State<MultipleChoice> {
  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;

  /*
  @override
  void initState() {
    super.initState();
    // Load ads.
  }
  final BannerAd myBanner = BannerAd(adUnitId: 'ca-app-pub-3940256099942544/6300978111', size: AdSize.banner, request: const AdRequest(), listener: const BannerAdListener(),);
  */
  void _pressed1(){
    _isPressed1 = true;
  }
  void _pressed2(){
    _isPressed2 = true;
  }
  void _pressed3(){
    _isPressed3 = true;
  }
  void _pressed4(){
    _isPressed4 = true;
  }

  void prompt(){
    if(answer1==correctAnswer){
      _pressed1();
    }else if(answer2==correctAnswer){
      _pressed2();
    }else if(answer3==correctAnswer){
      _pressed3();
    }else{
      _pressed4();
    }
  }

  static String t1 = "";
  static String answer1 = "";
  static String answer2 = "";
  static String answer3 = "";
  static String answer4 = "";
  static String correctAnswer = "";

  bool equals(String t,String s){
    int numb = int.parse(t.substring(0,2));
    int con = numb-1;
    if(numb>12) {
      con = numb - 12 - 1;
    }
    int minutes = int.parse(t.substring(3));
    if(minutes>30){
      con = numb;
    }
    int min = (minutes ~/ 5) - 1;
    var arr = ['One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Eleven','Twelve'];
    var arr2 = ['Five Past','Ten Past','Quarter Past','Twenty Past','TwentyFive Past','Half Past','TwentyFive to', 'Twenty to',
      'Quarter to','Ten to', 'Five to'];
    String word = "";
    String word2 = "";
    if(minutes==0) {
      word = s.substring(2, s.indexOf(' '));
      if(arr[con]==word){
        return true;
      }
      return false;
    }else {
      if(min<=5) {
        if(!s.contains('to')) {
          word = s.substring(s.indexOf('Past') + 5);
          word2 = s.substring(2, s.indexOf('Past') + 4);
        }else {
          word = s.substring(s.indexOf('to') + 3);
          word2 = s.substring(2, s.indexOf('to') + 2);
        }
      }else{
        if(!s.contains('Past')) {
          word = s.substring(s.indexOf('to') + 3);
          word2 = s.substring(2, s.indexOf('to') + 2);
        }else {
          word = s.substring(s.indexOf('Past') + 5);
          word2 = s.substring(2, s.indexOf('Past') + 4);
        }
      }
      if(arr[con]==word && arr2[min]==word2){
        return true;
      }
      return false;
    }
  }

  void increment(){
    v++;
  }

  Color evaluate(String ans){
    if (equals(t1,ans)){
      return Colors.green;
    }
    return Colors.red;
  }
  void _selected(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context){
          return scaffoldMaker();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var question = TimeQuestion("", "", "", "", "","");
    if(v<=14) {
      lst.add(TimeQuestion("17:00", "A.Five O'Clock", "B.Six O'CLock", "C.Seven O'Clock", "D.Four O'Clock","A.Five O'Clock"));
      lst.add(TimeQuestion("18:00", "A.Ten O'Clock", "B.Eight O'Clock", "C.Six O'Clock", "D.Three O'Clock","C.Six O'Clock"));
      lst.add(TimeQuestion("03:00","A.Seven O'Clock","B.Nine O'Clock","C.Six O'CLock","D.Three O'Clock","D.Three O'Clock"));
      lst.add(TimeQuestion("17:30","A.Half Past Seven","B.Quarter Past Five","C.Half Past Five","D.Five Past Six","C.Half Past Five"));
      lst.add(TimeQuestion("04:15", "A.Quarter Past Four", "B.Quarter Past Five", "C.Quarter to Four", "D.Five Past Three","A.Quarter Past Four"));
      lst.add(TimeQuestion("15:25", "A.TwentyFive Past Five", "B.Quarter Past Fifteen", "C.TwentyFive to Four", "D.TwentyFive Past Three", "D.TwentyFive Past Three"));
      lst.add(TimeQuestion("07:45", "A.Quarter to Seven", "B.Quarter Past Eight", "C.Quarter to Eight", "D.Quarter Past Seven", "C.Quarter to Eight"));
      lst.add(TimeQuestion("14:10", "A.Ten Past Four", "B.Ten to Two", "C.Ten Past Two", "D.Half Past Two", "C.Ten Past Two"));
      lst.add(TimeQuestion("11:50", "A.Ten to Twelve", "B.Twenty to Eleven", "C.Ten Past Twelve", "D.Five To One", "A.Ten to Twelve"));
      lst.add(TimeQuestion("20:00", "A.Eight O'Clock", "B.Two O'Clock", "C.Five O'Clock", "D.Six O'Clock", "A.Eight O'Clock"));
      lst.add(TimeQuestion("21:15", "A.Half Past Two", "B.Quarter Past Nine", "C.Quarter to Nine", "D.Five Past Two", "B.Quarter Past Nine"));
      lst.add(TimeQuestion("19:30", "A.Half Past Nine", "B.Half Past One", "C.Half Past Seven", "D.Half Past Six", "C.Half Past Seven"));
      lst.add(TimeQuestion("05:25", "A.Twenty Past Five ", "B.TwentyFive Past Five", "C.TwentyFive Past Six", "D.Twenty Past Four", "B.TwentyFive Past Five"));
      lst.add(TimeQuestion("10:05", "A.Half Past Ten", "B.Quarter Past Ten", "C.Quarter to Ten", "D.Five Past Ten", "D.Five Past Ten"));
      lst.add(TimeQuestion("23:00", "A.Eleven O'Clock", "B.Ten O'Clock", "C.Two O'Clock", "D.Three O'Clock", "A.Eleven O'Clock"));
      question = lst.elementAt(v);
    }else{
      return Scaffold(
        body: Center(
          child: Text("Marks: $total1/15"),
        ),
      );
    }
    t1 = question.time;
    answer1 = question.q1;
    answer2 = question.q2;
    answer3 = question.q3;
    answer4 = question.q4;
    correctAnswer = question.correct;
    /*
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    */
    return
      ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const Divider(),
            Container(height: 150,
              color: Colors.orange,
              child: Center(
                  child: Text(t1, style: const TextStyle(fontSize: 50),)),
            ),
            const Divider(),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: _isPressed1 ? MaterialStateProperty.all<Color>(evaluate(answer1)) : MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: (){setState(() {
                _pressed1();
                if(evaluate(answer1)==Colors.red) {
                  prompt();
                }else{
                  total1++;
                }
              });},
              child: Text(answer1),
            ),
            const Divider(),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: _isPressed2 ? MaterialStateProperty.all<Color>(evaluate(answer2)) : MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: (){setState(() {
                _pressed2();
                if(evaluate(answer2)==Colors.red) {
                  prompt();
                }else{
                  total1++;
                }
              });},
              child: Text(answer2),
            ),
            const Divider(),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: _isPressed3 ? MaterialStateProperty.all<Color>(evaluate(answer3)) : MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: (){setState(() {
                _pressed3();
                if(evaluate(answer3)==Colors.red) {
                  prompt();
                }else{
                  total1++;
                }
              });},
              child: Text(answer3),
            ),
            const Divider(),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: _isPressed4 ? MaterialStateProperty.all<Color>(evaluate(answer4)) : MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: (){setState(() {
                _pressed4();
                if(evaluate(answer4)==Colors.red) {
                  prompt();
                }else{
                  total1++;
                }
              });},
              child: Text(answer4),
            ),

            const Divider(),
            const Divider(),
            SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: (){
                    _selected();
                    increment();
                  },
                  child: const Text("Next Question"),
                ),
              ),
            ),
            Container(height: 60,
              color: Colors.white,
            ),
            const Divider(),
            /*
            Container(
              alignment: Alignment.center,
              child: adWidget,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            ),
            */
          ]
      );
  }
}

class TimeQuestion{
  String time = "";
  String q1 = "";
  String q2 = "";
  String q3 = "";
  String q4 = "";
  String correct = "";

  TimeQuestion(String ti,String a, String x, String y, String z, String c){
    time = ti;
    q1 = a;
    q2 = x;
    q3 = y;
    q4 = z;
    correct = c;
  }
}
class Analogue extends StatefulWidget {
  const Analogue({Key? key}) : super(key: key);
  @override
  _AnalogueState createState() => _AnalogueState();
}

class _AnalogueState extends State<Analogue> {
  final _myController = TextEditingController();
  bool _pressed = false;
  String clockAnswer = "";
  bool _added = true;
  /*
  @override
  void initState() {
    super.initState();
    // Load ads.
  }

  final BannerAd myBanner = BannerAd(adUnitId: 'ca-app-pub-3940256099942544/6300978111', size: AdSize.banner, request: const AdRequest(), listener: const BannerAdListener(),);
  */
  void increment2(){
    m++;
  }
  Color _isCorrect(String val){
    if(val==clockAnswer){
      if(_added){
        total2++;
      }
      _added = false;
      return Colors.green;
    }
    return Colors.red;
  }
  void _selected2(){
    _added = true;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context){
          return scaffoldMaker2();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var clockList = ['assets/C1.png','assets/C2.png','assets/C3.png','assets/C4.png','assets/C5.png','assets/C6.png','assets/C7.png','assets/C8.png','assets/C9.png','assets/C10.png'];
    var clockAns = ["THREE O'CLOCK","FIVE O'CLOCK","TEN TO TWO","TWENTYFIVE PAST SEVEN","QUARTER PAST SEVEN","FIVE TO SIX","HALF PAST FOUR","TWENTY TO ELEVEN","FIVE PAST TWO","TWELVE O'CLOCK"];
    String imageUsed = 'assets/space.jpg';
    if(m<10) {
      clockAnswer = clockAns[m];
      imageUsed = clockList[m];
    }else{
      return Scaffold(
        body: Center(
          child: Text("Marks: $total2/10"),
        ),
      );
    }
    /*
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    */
    return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget> [
          Image.asset(
            imageUsed,
            width: 290,
            height: 290,
          ),
          TextField(
            controller: _myController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Time on Clock(for Example: FOUR O'CLOCK)",
            ),
          ),
          SizedBox(
            height: 80,
            child:  TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: _pressed ? MaterialStateProperty.all<Color>(_isCorrect(value)) : MaterialStateProperty.all<Color>(Colors.orange),
              ),
              child: const Text("Click"),
              onPressed: (){
                setState(() {
                  value = _myController.text;
                  _pressed = true;
                }
                );
              },
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                onPressed: (){
                  increment2();
                  _selected2();
                },
                child: const Text("Next Question"),
              ),
            ),
          ),
          Container(height: 70,
            color: Colors.white,
          ),
          const Divider(),
          /*Container(
            alignment: Alignment.center,
            child: adWidget,
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ),*/
        ]
    );
  }
}
