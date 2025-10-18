import 'package:first_application/components/custom_counter.dart';
import 'package:first_application/components/profile_card.dart';
import 'package:flutter/material.dart';
import 'components/custom_card.dart';

class Week6 extends StatelessWidget {
  const Week6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Custom Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCard(text: 'Hello1', color: Colors.pinkAccent),
            CustomCard(text: 'Hello2', color: Colors.cyanAccent),
            CustomCard(text: 'Hello3', color: Colors.amberAccent),
          ],
        ),
      ),
    );
  }
}

class Week66 extends StatefulWidget {
  const Week66({super.key});

  @override
  State<Week66> createState() => _Week66State();
}

class _Week66State extends State<Week66> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Custom Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCounter(title: 'Team A', bgColor: Colors.pinkAccent),
            CustomCounter(title: 'Team B', bgColor: Colors.lightBlueAccent),
          ],
        ),
      ),
    );
  }
}

// Assignment I.
class Week6Assignment extends StatelessWidget {
  const Week6Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Card')),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileCard(
                name: 'Patipan Watjanapron',
                position: 'Programmer',
                email: 'patipan.wat@gmail.com',
                phoneNumber: '0821394214',
                imageUrl:
                    'https://picsum.photos/id/1/300/200',
              ),
              SizedBox(height: 30),
              ProfileCard(
                name: 'Pitchaya Pimmahasiri',
                position: 'Student',
                email: 'pimmahasiri_p@silpakorn.edu',
                phoneNumber: '0999999999',
                imageUrl:
                    'https://picsum.photos/id/237/300/200',
              ),
            ],
          ),
        )
      ),
    );
  }
}

// Theme Data (Dark/Light)
class SwitchTheme extends StatefulWidget {
  final Function switchMode;
  const SwitchTheme({super.key, required this.switchMode});

  @override
  State<SwitchTheme> createState() => _SwitchThemeState();
}

class _SwitchThemeState extends State<SwitchTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Mode Theme')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.switchMode();
              },
              child: Text('Switch mode')
            )
          ],
        )
      )
    );
  }
}

// Animation
class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  double _size = 100;
  Color _color = Colors.pinkAccent;
  double _opacity = 0;
  bool _isLeft = false;
  double _padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Example')),
      /* Zoom
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _size,
              width: _size,
              color: _color,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity, 
              duration: Duration(milliseconds: 500),
              child: Text('Hi CPSU', style: TextStyle(fontSize: 20))
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _size = _size == 100 ? 150 : 100;
                  _color = _color == Colors.pinkAccent ? Colors.lightBlueAccent : Colors.pinkAccent;
                  _opacity = _opacity == 0 ? 1 : 0;
                });
              }, 
             child: Text('Animated')
            )
          ],
        )
      ),
      */

      /* Align: Left-Right
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            alignment: _isLeft ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 200),
            child: Container(
              height: _size,
              width: _size,
              color: _color,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                _isLeft = !_isLeft;
              });
            }, 
            child: Text('Move Left Right')
          )
        ],
      ),
      */

      /* Padding
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: Duration(milliseconds: 500),
              child: Container(
                height: _size,
                width: _size,
                color: _color
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _size = _size == 100 ? 150 : 100;
                  _color = _color == Colors.pinkAccent ? Colors.lightBlueAccent : Colors.pinkAccent;
                  _opacity = _opacity == 0 ? 1 : 0;
                  _padding = _padding == 10 ? 50 : 10;
                });
              }, 
             child: Text('Animated')
            )
          ],
        )
      ),
      */

      /* Positioned
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _isLeft ? 20 : 250,
            top: _isLeft ? 100 : 200,
            child: Container(
              height: _size,
              width: _size,
              color: _color,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  _isLeft = !_isLeft;
                });
              },
              child: Text('Animated'),
            ),  
          )
        ],
      )
      */

    );
  }
}

// Assignment II.
class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
      )
    );
  }
}