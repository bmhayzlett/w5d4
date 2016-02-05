var exp = function (base, number) {
  if (number === 1) {
    return base;
  } else {
    return base * exp(base, number - 1);
  }
};

var fibs = function (num) {
  var fibNums = [];
  if (num === 0) {
    return [];
  } else if (num === 1) {
    return [1];
  } else if (num === 2) {
    return [1, 1];
  } else {
    fibNums = fibs(num - 1);
    fibNums.push(fibNums[fibNums.length-1] + fibNums[fibNums.length-2]);
  }
  return fibNums;
};

Array.prototype.binarySearch = function (target, index) {
  if (typeof index === "undefined") {
    index = 0;
  }

  var mid = Math.floor(this.length / 2);
  var left = this.slice(0, mid);
  var right = this.slice(mid, this.length);

  if (this.length <= 1) {
    if (this[0] === target) {
      return index;
    } else {
      return null;
    }
  }

  if (target < this[mid]) {
    return left.binarySearch(target, index);
  } else {
    index += left.length;
    return right.binarySearch(target, index);
  }
};

Array.prototype.mergeSort = function () {

  if (this.length < 2) {
    return this;
  }

  var mid = Math.floor(this.length / 2);
  var left = this.slice(0, mid);
  var right = this.slice(mid, this.length);

  return (mergeHelper(left.mergeSort(), right.mergeSort()));
};

var mergeHelper = function(left, right) {
  var returnedArray = [];
  while ((left.length > 0) && (right.length > 0)) {
    if (left[0] > right[0]) {
      returnedArray.push(right.shift());
    } else {
      returnedArray.push(left.shift());
    }
  }
  return returnedArray.concat(left).concat(right);
};
