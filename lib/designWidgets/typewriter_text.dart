import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final Duration duration;
  final double fontSize;
  final bool isBold;

  TypewriterText({
    required this.text,
    required this.fontSize,
    required this.isBold,
    this.duration = const Duration(milliseconds: 80),
  });

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  late String _animatedText;
  late int _currentIndex;
  late bool turn;

  @override
  void initState() {
    super.initState();
    _animatedText = '';
    _currentIndex = 0;
    _startTypingAnimation();
    turn = true;
  }

  void _startTypingAnimation() {
    Future.delayed(widget.duration, _typeNextCharacter);
  }

  void _typeNextCharacter() {
  setState(() {
    String extraCharacter = "|"; 

//     if(turn){
// extraCharacter = "|";
//     }
//     else {
//      extraCharacter =  " ";
//     }

if(_currentIndex == widget.text.length){
_animatedText = widget.text.substring(0, _currentIndex);
}
else {
    _animatedText = widget.text.substring(0, _currentIndex) + extraCharacter;

}
    // _animatedText = widget.text.substring(0, _currentIndex);
    _currentIndex++;

    //turn = !turn;


    if (_currentIndex <= widget.text.length) {
      _startTypingAnimation();
    }
    
  });
}


  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: widget.fontSize,
        
        color: Colors.white,
        fontWeight: (widget.isBold) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

