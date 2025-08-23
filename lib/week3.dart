import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> products = ['Apple', 'Sumsung', 'Oppo'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Card', style: TextStyle(color: Colors.white,)),
        backgroundColor: Colors.black,
      ),

      /*
      body: ListView(
        children: [
          Container(height: 200, width: double.infinity, color: const Color.fromARGB(255, 255, 170, 223), child: Text('Item1')),
          Container(height: 200, width: double.infinity, color: const Color.fromARGB(255, 165, 255, 168), child: Text('Item2')),
          Container(height: 200, width: double.infinity, color: const Color.fromARGB(255, 255, 245, 151), child: Text('Item3')),
          Container(height: 200, width: double.infinity, color: const Color.fromARGB(255, 144, 205, 255), child: Text('Item4')),
        ],
      ),
      */

      /*
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(products[index]),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            trailing: Icon(Icons.edit),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      */

      // Exercise I.
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300, 
              height: 400, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('images/abstract-pink-watercolor-background-pastel-soft-water-color-pattern-vector.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  )
                ]
              ),
            ),
            Positioned(
              top: 20,
              child: Container(
                width: 250,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('images/435724916_1816309692203144_4943476744315204682_n.jpg'),
                    fit: BoxFit.cover,
                  )
                )
              )
            ),
            Positioned(
              top: 340,
              left: 20,
              child: Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/barcode-transparent-resolution-format-1.png'),
                    fit: BoxFit.cover,
                  )
                )
              )
            ),
            Positioned(
              top: 260,
              left: 30,
              child: Text(
                'Pitchaya\nPimmahasiri',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                )
              )
            ),
            Positioned(
              top: 325,
              left: 30,
              child: Text(
                'ID: 650710572',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.0,
                )
              )
            ),
            Positioned(
              top: 265,
              right: 30,
              child: Text(
                '4th Year\nComSci\nSilpakorn',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.0,
                )
              )
            ),
            Positioned(
              top: 345,
              right: 30,
              child: Text(
                '"Je crois en moi"\n(I believe in myself)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  height: 1.0,
                )
              )
            ),
          ],
        )
      ),
    );
  }
}