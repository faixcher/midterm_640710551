import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var _text = '0';
  var _buffer = '';
  var _buffer_OP = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate,
              color: Colors.brown,
            ),
            SizedBox(width: 8), // Add some space between icon and text
            Text('MY CALCULATOR'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _text,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('C', flex: 1, color: Colors.grey),
              _buildButton('⌫', flex: 1, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              _buildButton('7', flex: 1, color: Colors.lightBlue),
              _buildButton('8', flex: 1, color: Colors.lightBlue),
              _buildButton('9', flex: 1, color: Colors.lightBlue),
              _buildButton('÷', flex: 1, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              _buildButton('4', flex: 1, color: Colors.lightBlue),
              _buildButton('5', flex: 1, color: Colors.lightBlue),
              _buildButton('6', flex: 1, color: Colors.lightBlue),
              _buildButton('x', flex: 1, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              _buildButton('1', flex: 1, color: Colors.lightBlue),
              _buildButton('2', flex: 1, color: Colors.lightBlue),
              _buildButton('3', flex: 1, color: Colors.lightBlue),
              _buildButton('-', flex: 1, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              _buildButton('0', flex: 3, color: Colors.lightBlue),
              _buildButton('+', flex: 1, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              _buildButton('=', flex: 1, color: Colors.red),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(String label, {int flex = 1, required Color color}) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: () {
          setState(() {
            //_text = Random().nextInt(100).toString();
            action(label);
          });
        },
        
        child: Container(
          
          margin: EdgeInsets.all(3),
          height: 120.0,
          
          color: color,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  void action(String label) {
    if (label == 'C') {
      _text = '0';
      _buffer = '';
    } else if (label == '⌫') {
      //_buffer =_buffer.substring(, _buffer.length - 1);
      if (_buffer.isNotEmpty) {
        // Remove the last character by creating a new string
        _buffer = _buffer.substring(0, _buffer.length - 1);
        _text = _buffer;
      }
    } else if (label == '=') {
      _text = '0';
      _buffer = '';
    } else if (label == '÷') {
      
      if (_buffer_OP != '÷') {
        _buffer_OP = '÷';
        _buffer += label;
        _text = _buffer;
      }
    } else if (label == '+' ) {
      if (_buffer_OP != '+') {
        _buffer_OP = '+';
        _buffer += label;
        _text = _buffer;
      }
    } else if (label == '-' ) {
      if (_buffer_OP != '-') {
        _buffer_OP = '-';
        _buffer += label;
        _text = _buffer;
      }
    } else if (label == 'x') {
      if (_buffer_OP != 'x') {
        _buffer_OP = 'x';
        _buffer += label;
        _text = _buffer;
      }
    } else {
      _buffer += label;
      _text = _buffer;
      _buffer_OP = '';
    }
  }
}
