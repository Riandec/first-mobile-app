import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({super.key});

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _basePrice = 150;
  bool _vacuum = false;
  bool _wax = false;
  int total = 150;

  void calculateTotal() {
    total = _basePrice;
    if (_vacuum == true) {
      total += 50;
    }
    if (_wax == true) {
      total += 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำนวณค่าบริการล้างรถ')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // car size
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'ขนาดรถ'),              
                value: _basePrice,
                items: [
                  DropdownMenuItem(value: 150, child: Text('รถเล็ก (Small) - 150 บาท')),
                  DropdownMenuItem(value: 200, child: Text('รถเก๋ง (Medium) - 200 บาท')),
                  DropdownMenuItem(value: 250, child: Text('รถ SUV/กระบะ (Large) - 250 บาท')),
                ], 
                onChanged: (value){
                  setState(() {
                    _basePrice = value!;
                    calculateTotal();
                  });
                }
              ),
              SizedBox(height: 20),
              // optional
              CheckboxListTile(
                title: Text('ดูดฝุ่น (+50 บาท)'),
                value: _vacuum, 
                onChanged: (bool? value){
                  setState(() {
                    _vacuum = value!;
                    calculateTotal();
                  });
                }
              ),
              CheckboxListTile(
                title: Text('เคลือบแว็กซ์ (+100 บาท)'),
                value: _wax, 
                onChanged: (bool? value){
                  setState(() {
                    _wax = value!;
                    calculateTotal();
                  });
                }
              ),
              SizedBox(height: 10),
              /* 
              // sum price: ย้ายไปสร้าง function ให้ราคารวมอัปเดตอัตโนมัติทุก setState()

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    total = _basePrice;
                    if (_vacuum == true) {
                      total += 50;
                    }
                    if (_wax == true) {
                      total += 100;
                    }
                  });
                }, 
                child: Text('คำนวณราคา')
              ),
              SizedBox(height: 20),
              */
              // display
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SizedBox(height: 10),
              Text(
                'ราคารวม: $total บาท',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        )
      )
    );
  }
}