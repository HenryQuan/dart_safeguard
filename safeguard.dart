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
  
  var result = Guard(testing, 'More.More.Even.123', null);
  print(result);
	result = Guard(testing, 'More.More.Even.More', null);
  print(result);
}

Guard(obj, path, dval) {
  // check if obj is null
  if (path == '' && obj != null) return obj;
  // check if object is valid and path does not start with or end with '.'
  if (!path.startsWith('.') && !path.endsWith('.')) {
    List p = path.split('.');
    if (p != null && p.length > 0) {
      // Take obj as the default value and only go deeper if o and o[n] are both valid
      return p.fold(obj, (o, n) => (o != null && o[n] != null) ? o[n] : dval);
    }
  } 
  return dval;
}
