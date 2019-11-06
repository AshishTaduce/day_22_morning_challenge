import 'main.dart';
import "package:test/test.dart";
void main() {
  test("Test Case 1",(){
    expect(mineSweep([
      [1, 9, 2, 1],
      [2, 3, 9, 2],
      [3, 9, 4, 9],
      [9, 9, 3, 1],
    ]),
        [
      [1, 9, 2, 1],
      [2, 3, 9, 2],
      [3, 9, 4, 9],
      [9, 9, 3, 1],
    ]);
  });
  test("Test Case 2",(){
    expect('', '');
  });
}

