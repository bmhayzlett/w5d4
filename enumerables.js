Array.prototype.myEach = function (funky) {
  for (var i = 0; i < this.length; i++ ) {
    funky(this[i]);
  }
  return this;
}

// var add = function (number) {
//   return (number + 1);
// }


Array.prototype.myMap = function (funky) {
  var mappedArray = [];

  var pushResult = function(el) {
    mappedArray.push(funky(el));
  }

  this.myEach(pushResult);

  return mappedArray;
}

var add = function (number1, number2) {
  return (number1 + number2);
}

var subtract = function (number1, number2) {
  return (number1 - number2);
}

Array.prototype.myInject = function (funky) {
  var accum = this.shift();

  var accumResult = function(el) {
    accum = funky(accum,el);
  }

  this.myEach(accumResult);

  return accum;

}
