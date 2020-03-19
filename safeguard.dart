void main() {
  final testing = {
    'Hello': 1,
    'More': {
      'More': {
        'Even': {'More': 123}
      }
    }
  };

  var result = guard(testing, 'More.More.Even.123', null);
  assert(result == null);
  result = guard(testing, 'More.More.Even.More', null);
  assert(result == 123);

  final testArray = {
    'Hello': {
      'World': [
        {'node': 1},
        {'node': 2}
      ]
    }
  };

  result = guard(testArray, 'Hello.World.1.node', null);
  assert(result == 2);
}

/// Takes an `object`, a `path` and a `default value`.
/// Returns whether the valid value or the default value
guard(obj, String path, dval) {
  // check if obj is null
  if (path == '' && obj != null) return obj;
  // check if object is valid and path does not start with or end with '.'
  if (!path.startsWith('.') && !path.endsWith('.')) {
    final p = path.split('.');
    if (p != null && p.length > 0) {
      return p.fold(obj, (curr, key) {
        // Make sure curr is valid
        if (curr != null) {
          final indexKey = int.tryParse(key);
          if (indexKey != null)
            return curr[indexKey] != null ? curr[indexKey] : dval;
          return curr[key] != null ? curr[key] : dval;
        }
      });
    }
  }
  return dval;
}
