// LAB-2

// ------------------------------------
//              Task 1
import 'dart:math';

task1PartA(String name) {
  print("Hello $name, Welcome to Flutter");
}

task1PartB([String name = "Guest"]) {
  print("Hello $name, Welcome to Flutter");
}

// ------------------------------------
//              Task 2

// set in integers
Set<int> set1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// array of strings
List<String> list1 = ['a', 'b', 'c', 'd', 'e', 'f'];

// map of integers and strings
Map<int, String> map1 = {};

task2PartA_a() {
  print("Task 2 Part A Section A");


  if (set1.length > list1.length) {
    print("Set 1 is greater than List 1");
    int diff = set1.length - list1.length;
    print("Difference is $diff");
    for (int i = 0; i < diff; i++) {
      list1.add('0');
    }
    print('Updated List 1: $list1');
  } else if (set1.length < list1.length) {
    print("set of integers is greater than list of strings");
    int diff = list1.length - set1.length;
    print("Difference is $diff");
    for (int i = 0; i < diff; i++) {
      set1.add(0);
    }
    print('Updated Set 1: $set1');
  } else {
    print("Both Sets and Lists are equal");
  }
}

task2PartA_b() {
  print("Task 2 Part B Section B");
  // set in integers
  Set<int> set1 = {1, 2, 3, 4};

  // array of strings
  List<String> list1 = ['a', 'b', 'c', 'd', 'e', 'f'];

  // if set1 is smaller remove last element of list1
  if (set1.length < list1.length) {
    list1.removeLast();
    print('Updated List 1: $list1');
  }
}

task2PartB_a() {
  print("Task 2 Part B Section A");
  map1 = Map.fromIterables(set1, list1);
  print('Map 1: $map1');
}

task2PartB_b() {
  print("Task 2 Part B Section B");
  Map<String, int> map2 = map1.map((key, value) => MapEntry(value, key));
  print('Map 2: $map2');
}

// ------------------------------------
//              Task 3

// Part A
class Point {
  int x = 0;
  int y = 0;

  // constructor named origin for x=0 and y=0
  origin() {
    x = 0;
    y = 0;
  }

  // getter for x
  int get getX => x;
  // getter for y
  int get getY => y;

  // Named Constructor for Point
  Point(this.x, this.y);
  
}

// Part B
class Size {
  int w;
  int h;

  origin() {
    w = 0;
    h = 0;
  }

  // fields modified by cascading
  int get getWidth => w;
  int get getHeight => h;

  // optional named constructor
  Size([this.w = 0, this.h = 0]);

  // getter and setters for h and w
  int get getH => h;
  int get getW => w;

  set setH(int h) => this.h = h;
  set setW(int w) => this.w = w;

  // factory constructor throws exception for negative values
  factory Size.fromNegative(int width, int height) {
    if (width < 0 || height < 0) {
      throw Exception("Negative values not allowed");
    }
    return Size(width, height);
  }
}

// Part C
class Frame {
  var position;
  var size;

  //redirecting constructor
  Frame(int x, [this.position = 0, this.size = 0]);

  //getter and setter for position and size
  int get getPosition => position;
  int get getSize => size;

  set setPosition(int p) => position = p;
  set setSize(int s) => size = s;
  
  // getters for x y w and h
  int get getX => position;
  int get getY => position;
  int get getW => size;
  int get getH => size;
  
  // setters for x y w and h
  set setX(int x) => position = x;
  set setY(int y) => position = y;
  set setW(int w) => size = w;
  set setH(int h) => size = h;
  
  // factory constructor throws exception for negative values of w and h
  factory Frame.fromNegative(int w, int h) {
    if (w < 0 || h < 0) {
      throw Exception("Negative values not allowed");
    }
    return Frame(w, h);
  }
  
  // named constructor
  Frame.fromSize(int x, int y, int w, int h) {
    position = x;
    size = y;
    setW = w;
    setH = h;
  }  
}

// ------------------------------------
//              Task 4
class Matrices {
  int rows = 0;
  int cols = 0;

  // addition of two matrices
  List<List<int>> addMatrix(List<List<int>> a, List<List<int>> b) {
    // validate input
    if (a.length != b.length || a[0].length != b[0].length) {
      throw Exception("Matrices are not of same size");
    } else if (a.isEmpty || b.isEmpty) {
      throw Exception("Matrices are empty");
    } else {
      List<List<int>> c = [];
      for (int i = 0; i < a.length; i++) {
        List<int> row = [];
        for (int j = 0; j < a[i].length; j++) {
          row.add(a[i][j] + b[i][j]);
        }
        c.add(row);
      }
      return c;
    }
  }

  // subtraction of two matrices
  List<List<int>> subMatrix(List<List<int>> a, List<List<int>> b) {
    // validate input
    if (a.length != b.length || a[0].length != b[0].length) {
      throw Exception("Matrices are not of same size");
    } else if (a.isEmpty || b.isEmpty) {
      throw Exception("Matrices are empty");
    } else {
      List<List<int>> c = [];
      for (int i = 0; i < a.length; i++) {
        List<int> row = [];
        for (int j = 0; j < a[i].length; j++) {
          row.add(a[i][j] - b[i][j]);
        }
        c.add(row);
      }
      return c;
    }
  }

  // multiplication of two matrices
  List<List<int>> mulMatrix(List<List<int>> a, List<List<int>> b) {
    // validate input
    if (a[0].length != b.length) {
      throw Exception("Matrices are not of same size");
    } else if (a.isEmpty || b.isEmpty) {
      throw Exception("Matrices are empty");
    } else {
      List<List<int>> c = [];
      for (int i = 0; i < a.length; i++) {
        List<int> row = [];
        for (int j = 0; j < b[i].length; j++) {
          int sum = 0;
          for (int k = 0; k < a[i].length; k++) {
            sum += a[i][k] * b[k][j];
          }
          row.add(sum);
        }
        c.add(row);
      }
      return c;
    }
  }

  // transpose of a matrices
  List<List<int>> transposeMatrix(List<List<int>> a) {
    // validate input
    if (a.isEmpty) {
      throw Exception("Matrices are empty");
    } else if (a.length != a[0].length) {
      throw Exception("Matrices are not square");
    } else {
      List<List<int>> c = [];
      for (int i = 0; i < a.length; i++) {
        List<int> row = [];
        for (int j = 0; j < a[i].length; j++) {
          row.add(a[j][i]);
        }
        c.add(row);
      }
      return c;
    }
  }

  //print statement that prints the matrices
  printMatrix(List<List<int>> a) {
    // validate input
    if (a.isEmpty) {
      throw Exception("Matrices are empty");
    } else {
      // print matrix
      for (int i = 0; i < a.length; i++) {
        print(a[i]);
      }
    }
  }

  // constructor with optional parameter
  Matrices(this.rows, this.cols);

  // Matrices([List<List<int>> a]){}

  // factory method to create matrix with random values
  factory Matrices.random(int rows, int cols) {
    List<List<int>> a = [];
    for (int i = 0; i < rows; i++) {
      List<int> row = [];
      for (int j = 0; j < cols; j++) {
        row.add(Random().nextInt(10));
      }
      a.add(row);
    }
    return Matrices(rows, cols);
  }

  // getter and setter for rows and column count
  int get getRows => this.rows;
  int get getCols => this.cols;
  set setRows(int r) => this.rows = r;
  set setCols(int c) => this.cols = c;

  main() {
    print('Addition of two matrices');
    printMatrix(addMatrix([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ], [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
    print('Subtraction of two matrices');
    printMatrix(subMatrix([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ], [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
    print('Multiplication of two matrices');
    printMatrix(mulMatrix([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ], [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
    print('Transpose of a matrices');
    printMatrix(transposeMatrix([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
  }
}

// ------------------------------------
//              Task 5
class PhoneBook {
  // 2D array of strings
  var phoneBook = [
    [
      'Ali',
      'Ahmed',
      'Imran',
      'Nashit',
      'Usman',
      'Sarah',
      'Aisha',
      'Nashra',
      'Hafsa',
      'Areeba'
    ],
    [
      '111-111-1111',
      '222-222-2222',
      '333-333-3333',
      '444-444-4444',
      '555-555-5555',
      '666-666-6666',
      '777-777-7777',
      '888-888-8888',
      '999-999-9999',
      '000-000-0000'
    ]
  ];

  Map<String, String> nameToNumber = {};
  Map<String, String> numberToName = {};

  mapping() {
    for (int i = 0; i < 10; i++) {
      nameToNumber[phoneBook[0][i]] = phoneBook[1][i];
      numberToName[phoneBook[1][i]] = phoneBook[0][i];
    }
  }

  void lookupNumber(String nameOrNumber) {
    if (nameToNumber.containsKey(nameOrNumber)) {
      print('Phone number for $nameOrNumber is ${nameToNumber[nameOrNumber]}');
    } else if (numberToName.containsKey(nameOrNumber)) {
      print('Name for $nameOrNumber is ${numberToName[nameOrNumber]}');
    } else {
      print('Not found');
    }
  }

  void main() {
    mapping();
    lookupNumber('Aisha');
    lookupNumber('555-555-5555');
    lookupNumber('123-456-7890');
  }
}
