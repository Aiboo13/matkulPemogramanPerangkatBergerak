import 'package:flutter/material.dart';

void main() => runApp(const KonversiSuhuApp());

// Root aplikasi konversi suhu.
class KonversiSuhuApp extends StatelessWidget {
  const KonversiSuhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SuhuHomePage(),
    );
  }
}

class SuhuHomePage extends StatefulWidget {
  const SuhuHomePage({super.key});

  @override
  State<SuhuHomePage> createState() => _SuhuHomePageState();
}

class _SuhuHomePageState extends State<SuhuHomePage> {
  // Controller untuk membaca input suhu dari TextField.
  final TextEditingController _inputController = TextEditingController();
  double _result = 0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  // Daftar satuan suhu yang didukung.
  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur'];

  // Menghitung konversi suhu dengan Celsius sebagai satuan perantara.
  void _hitungKonversi() {
    double input = double.tryParse(_inputController.text) ?? 0;
    double celsius;

    // 1. Ubah input asal ke Celsius (sebagai perantara)
    switch (_fromUnit) {
      case 'Fahrenheit':
        celsius = (input - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = input - 273.15;
        break;
      case 'Reamur':
        celsius = input * 5 / 4;
        break;
      default:
        celsius = input; // Celsius
    }

    // 2. Ubah dari Celsius ke satuan tujuan
    setState(() {
      switch (_toUnit) {
        case 'Fahrenheit':
          _result = (celsius * 9 / 5) + 32;
          break;
        case 'Kelvin':
          _result = celsius + 273.15;
          break;
        case 'Reamur':
          _result = celsius * 4 / 5;
          break;
        default:
          _result = celsius; // Celsius
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Suhu')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Input nilai suhu dari pengguna.
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nilai Suhu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Pemilihan satuan asal dan satuan tujuan.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  _fromUnit,
                  (val) => setState(() => _fromUnit = val!),
                ),
                const Icon(Icons.arrow_forward),
                _buildDropdown(
                  _toUnit,
                  (val) => setState(() => _toUnit = val!),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Tombol eksekusi perhitungan konversi.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: _hitungKonversi,
              child: const Text('HITUNG'),
            ),
            const SizedBox(height: 30),
            // Menampilkan hasil konversi dengan 2 angka desimal.
            Text(
              'Hasil: ${_result.toStringAsFixed(2)} $_toUnit',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Widget dropdown reusable untuk memilih satuan suhu.
  Widget _buildDropdown(String value, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: value,
      items: _units
          .map((u) => DropdownMenuItem(value: u, child: Text(u)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
