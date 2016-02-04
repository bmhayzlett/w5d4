Array.prototype.uniq = function () {
  var uniques = [this[0]]
  for (var i = 1; i < this.length; i++) {
    for(var j = 0; j < uniques.length; j++) {
      if( this[i] === uniques[j] ) {
        break;
      } else if (j === uniques.length - 1) {
        uniques.push(this[i])
      }
    }
  }
  return uniques;
}

Array.prototype.twoSum = function (sum) {
  var indices = []
  for (var i = 0; i < this.length; i++) {
    for ( j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === sum) { indices.push([i,j]); }
    }
  }
  return indices;
}

Array.prototype.transpose = function () {
  var transposed = []
  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this[i].length; j++) {
      if (i === 0) { transposed.push([]) }
      transposed[j].push(this[i][j]);
    }
  }
  return transposed;
}
