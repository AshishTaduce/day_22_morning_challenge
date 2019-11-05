// Challenge 1
// Write test cases for the challenges including boundary conditions

// Challenge 2
// Minesweeper Number of Neighbouring Mines
// Create a function that takes an array representation of a Minesweeper board,
// and returns another board where the value of each cell is the amount of its neighbouring mines.
// Examples
//  The input may look like this:
//
//  [
//    [0, 1, 0, 0],
//    [0, 0, 1, 0],
//    [0, 1, 0, 1],
//    [1, 1, 0, 0],
//  ]
//  The 0 represents an empty space . The 1 represents a mine.
//
//  You will have to replace each mine with a 9 and each empty space with the
//  number of adjacent mines, the output will look like this:
//
//  [
//    [1, 9, 2, 1],
//    [2, 3, 9, 2],
//    [3, 9, 4, 9],
//    [9, 9, 3, 1],
//  ]
List <List> mineSweep(List <List> input){
  List <List> result = input;
  int count = 0;
  for (List list in input){
    for (int x in list){
      if (x == 1){
        x = 9;
      }
    }
  }
  for (int i = 0; i < input.length; i++){

    for (int j = 0; j < input[i].length; j++){

      if (input[i][j] == 9)  {
        count = 9;
      }
      else {
        count = 0;
        if (i!=0 && j!=0 && input[i - 1][j - 1] != null && input[i - 1][j - 1] == 9) {
          count ++;
        }
        if (i!=0 && input[i - 1][j] != null && input[i - 1][j] == 9) {
          count ++;
        }
        if (j != 3 && i!=0 && input[i - 1][j + 1] != null && input[i - 1][j + 1] == 9) {
          count ++;
        }
        if (j!= 0 && input[i][j - 1] != null && input[i][j - 1] == 9) {
          count ++;
        }
        if (j != 3 && input[i][j + 1] != null && input[i][j + 1] == 9) {
          count ++;
        }
        if (i != 3 && j!= 0 && input[i + 1][j - 1] != null && input[i + 1][j - 1] == 9) {
          count ++;
        }
        if (i != 3 &&input[i + 1][j] != null && input[i + 1][j] == 9) {
          count ++;
        }
        if (j != 3 && i != 3 && input[i + 1][j + 1] != null && input[i + 1][j + 1] == 9) {
          count ++;
        }

      }
      result[i][j]= count;

    }
  }
  return result;
}
// Challenge 3
// Group in Order
// Create a function that groups an array of numbers based on a size parameter. The size represents the maximum length of each sub-array.
//
//  [1, 2, 3, 4, 5, 6], 3
//  [[1, 3, 5], [2, 4, 6]]
/// Divide array into groups of size 3.
//
//  [1, 2, 3, 4, 5, 6], 2
//  [[1, 4], [2, 5], [3, 6]]
/// Divide array into groups of size 2.
//
//  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 4
//  [[1, 4, 7, 10], [2, 5, 8, 11], [3, 6, 9]]
/// "Leftover" arrays are okay.

bool checkDivisor(int len, int num){
  for(int j = num; 2 < j; j--){
    if(len%j == 0){
      return true;
    }
  }
  return false;

}

List <List<int>> groupInOrder(List<int>list, int num) {
  List <List<int>> finalList = [];


  if(list.length%num == 0 || checkDivisor(list.length, num) == false) {
    groupThis(list, num, finalList);
  }

  else if(list.length%num != 0 && checkDivisor(list.length, num) == true){
    for(int k = num; 1 < k; k--){
      if(list.length%k == 0){
        groupThis(list, k, finalList);
        break;
      }
    }
  }

  return finalList;
}

void groupThis(List<int> list, int num, List<List<int>> finalList) {
  for (int i = 0; i < list.length; i += num) {
    int end = (i + num < list.length) ? i + num : list.length;
    finalList.add(list.sublist(i, end));
  }
}


main() {
  print(mineSweep([
    [1, 9, 2, 1],
    [2, 3, 9, 2],
    [3, 9, 4, 9],
    [9, 9, 3, 1],
  ]));

}
