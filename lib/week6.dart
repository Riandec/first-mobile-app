import 'package:flutter/material.dart';
import 'components/custom_card.dart';
import 'components/custom_counter.dart';
import 'components/profile_card.dart';
import 'components/light_deco.dart';

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
  String _currentLight = 'red';
  double _redOpacity = 1.0;
  double _yellowOpacity = 0.3;
  double _greenOpacity = 0.3;

  @override
  void initState() {
    super.initState();

  }

  void changeLight () {
    if (_currentLight == 'red') {
      _currentLight = 'yellow';
      _redOpacity = 0.3;
      _yellowOpacity = 1.0;
      _greenOpacity = 0.3;
    } else if (_currentLight == 'yellow') {
      _currentLight = 'green';
      _redOpacity = 0.3;
      _yellowOpacity = 0.3;
      _greenOpacity = 1.0;
    } else {
      _currentLight = 'red';
      _redOpacity = 1.0;
      _yellowOpacity = 0.3;
      _greenOpacity = 0.3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Light Animation'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LightDeco(
              opacity: _redOpacity,
              lightColor: Colors.red,
            ),
            SizedBox(height: 15),
            LightDeco(
              opacity: _yellowOpacity,
              lightColor: Colors.yellow,
            ),
            SizedBox(height: 15),
            LightDeco(
              opacity: _greenOpacity,
              lightColor: Colors.green,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  changeLight();
                });
              }, 
              child: Text('เปลี่ยนไฟ')
            )
          ],
        )
      )
    );
  }
}