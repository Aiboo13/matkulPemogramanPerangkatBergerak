|  Nama | Moh. Minas Sahiddin |
|:-----:|---------------------|
|  Nrp  | 3124521045          |
| Kelas | 2 TI - B            |
---

# Praktikum 1
---
tugas:
```
menambahkan fungsi button decrement
```

hasil tugas ![tugas](/hasil2.png)
---
hasil tugas ![tugas](/hasil.png)
---

code yang dirubah

```
floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16), // adding some space between the buttons
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
```

---

inisialisasi fungsi

```
int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
```