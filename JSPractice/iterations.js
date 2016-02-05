Array.prototype.bubbleSort = function () {
  var swapped = true

  while (swapped) {
    swapped = false

    for (var i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        var temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        swapped = true
      }
    }
  }
  return this;
}

String.prototype.substrings = function () {

  var subs = [];

  for (var i = 0; i < this.length; i++) {

    if (subs.indexOf(this[i]) === -1) {
      subs.push(this[i]);
    }

    for (var j = i+1; j < this.length + 1; j++) {
      var sliced = this.slice(i,j+1);
      if (subs.indexOf(sliced) === -1) {
        subs.push(sliced);
      }
    }
  }
  return subs;
}
