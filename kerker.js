// method
var Add = function(a, b){
  return a + b;
};

// arrange
var firstNum = 1;
var secondNum = 2;
var expected = 3;

// This is a test :\
var result = Add(firstNum, secondNum);

// assert
check(expected, result);
