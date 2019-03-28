void main() {
  var testing = {
    'Hello': 1,
    'More': {
      'More': {
        'Even': {
          'More': 123
        }
      }
    }
  };
  
  var result = Guard(testing, 'More.More.Even.More', null);
  print(result);
}

Guard(obj, path, dval) {
  // This is a just a simple check if obj is null or undefined
  if (path == '' && obj != null) return obj;
  // check if object is valid and path does not start with or end with '.'
  if (!path.startsWith('.') && !path.endsWith('.')) {
    // get path as an array and it must have at least 2 elements
    var p = path.split('.');
    print(p);
    if (p != null && p.length > 0) {
      // o is the object (accumulator), and n is from path (current value)
      // o && o[n] -> to go further or just return default value
      // only asking for the object
      var value = p.reduce((o, n) => (o != null && o[n] != null) ? o[n] : dval, obj);
      print(value);
      return value;
    }
  } 
  return dval;
}
