# UnionState
[![Build Status](https://shields.io/github/actions/workflow/status/surfstudio/flutter-union-state/main.yml?logo=github&logoColor=white)](https://github.com/surfstudio/flutter-union-state)
[![Coverage Status](https://img.shields.io/codecov/c/github/surfstudio/flutter-union-state?logo=codecov&logoColor=white)](https://codecov.io/gh/surfstudio/flutter-union-state)
[![Pub Version](https://img.shields.io/pub/v/union_state?logo=dart&logoColor=white)](https://pub.dev/packages/union_state)
[![Pub Likes](https://badgen.net/pub/likes/union_state)](https://pub.dev/packages/union_state)
[![Pub popularity](https://badgen.net/pub/popularity/union_state)](https://pub.dev/packages/union_state/score)
![Flutter Platform](https://badgen.net/pub/flutter-platform/union_state)

This package is part of the [SurfGear](https://github.com/surfstudio/SurfGear) toolkit made by [Surf](https://surf.dev).

## Target

Replace EntityState from Elementary

## Description

The package includes the following classes:

### UnionState
A universal model for mapping basic UI states.

Internal replacement for [EntityState]. Unlike [EntityState]:
 * Guarantees a non-zero result [T].
 * Explicitly guarantees only 3 states: loading, content, error.

```dart
final _countryListState = UnionStateNotifier<Iterable<Country>>.loading();

  Future<void> _loadCountryList() async {
    final previousData = _countryListState.value.data;

    // set property to loading state and use previous data for this state
    _countryListState.loading(previousData);

    try {
      // await the result
      final res = await model.loadCountries();
      // set property to content state, use new data
      _countryListState.content(res);
    } on Exception catch (e) {
      // set property to error state
      _countryListState.failure(e, previousData);
    }
  }
```

### UnionStateListenableBuilder

Presentation part builder for [ValueListenable] and [UnionState].

```dart
// ......
@override
Widget build(IExampleWM wm) {
  return Scaffold(
    appBar: AppBar(),
    body: UnionStateListenableBuilder<String>(
      unionStateListenable: wm.dataState,
      builder: (_, data) => Center(child: Text(data)),
      loadingBuilder: (_, lastData) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (lastData != null) ...[
              const SizedBox(height: 10),
              Text('Last data: $lastData'),
            ],
          ],
        ),
      ),
      failureBuilder: (_, exception, lastData) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(exception.toString()),
            if (lastData != null) ...[
              const SizedBox(height: 10),
              Text('Last data: $lastData'),
            ],
          ],
        ),
      ),
    ),
  );
}
// ......
```

### UnionStateNotifier

Internal replacement for [EntityStateNotifier]. Unlike [EntityState]:
 * Guarantees a non-zero result [T].
 * Explicitly guarantees only 3 states: loading, content, failure.

```dart
class ExampleModel extends ElementaryModel {
  final _random = Random();
  final dataState = UnionStateNotifier<String>.loading();

  void initLoadData() {
    dataState.loading(dataState.value.data);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        _random.nextInt(10) < 8
            ? dataState.content('Loaded Data')
            : dataState.failure();
      },
    );
  }
}
```

### Implementation examples

[An example](https://github.com/surfstudio/flutter-union-state/tree/main/example)