# Dart Safeguard

Please write a model whenever possible and avoid using this. However, this is indeed really handy to retreive data from an object.

# Usage

```
obj - anything
path - names connected with dots
dval - a default value
```

## Path

For example, `This.is.an.example.1.value` will get `1` from the following object.

```dart
{
  'This': {
    'is': {
      'an': {
        'example': [
          {
            'value': 0
          },
          {
            'value': 1
          },
        ]
      }
    }
  }
};
```

Try it on https://dartpad.dartlang.org/
