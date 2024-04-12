# Union State

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/surfstudio/flutter-open-source/blob/887525c23f4d57a2d96fc2e6a31e15d1e29d1787/assets/logo_white.png">
  <img alt="Shows an illustrated sun in light color mode and a moon with stars in dark color mode." src="https://github.com/surfstudio/flutter-open-source/blob/887525c23f4d57a2d96fc2e6a31e15d1e29d1787/assets/logo_black.png" width ="200">
</picture>

Made by [Surf 🏄‍♂️🏄‍♂️🏄‍♂️](https://surf.dev/)

[![Build Status](https://shields.io/github/actions/workflow/status/surfstudio/flutter-union-state/on_pull_request.yml?logo=github&logoColor=white)](https://github.com/surfstudio/flutter-union-state)
[![Coverage Status](https://img.shields.io/codecov/c/github/surfstudio/flutter-union-state?logo=codecov&logoColor=white)](https://codecov.io/gh/surfstudio/flutter-union-state)
[![Pub Version](https://img.shields.io/pub/v/union_state?logo=dart&logoColor=white)](https://pub.dev/packages/union_state)
[![Pub Likes](https://badgen.net/pub/likes/union_state)](https://pub.dev/packages/union_state)
[![Pub popularity](https://badgen.net/pub/popularity/union_state)](https://pub.dev/packages/union_state/score)
![Flutter Platform](https://badgen.net/pub/flutter-platform/union_state)

## Overview

A simple union with three states (loading, data, and error) based on sealed classes and ChangeNotifier.
Used for delivering data to the UI layer, for example, using the [Elementary library](https://pub.dev/packages/elementary).
The package includes the following classes:

### UnionState

A universal model for mapping basic UI states.

Can be used as internal replacement for [EntityState]. Unlike [EntityState]:

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

Note that a non-zero result [T] is only guaranteed for UnionStateContent. But not for load and fail.

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

A custom [ValueNotifier] that encapsulates the state of a union type. It provides methods
 to manage different states of data:

-[content]: Represents a state with successful content.
-[failure]: Represents a state with an error and, optionally, previous data.
-[loading]: Represents a state indicating that data is being loaded.

Can be used as internal replacement for [EntityStateNotifier]. Unlike [EntityState]:

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

## Installation

Add `union_state` to your `pubspec.yaml` file:

```yaml
dependencies:
  union_state: $currentVersion$
```

<p>At this moment, the current version of <code>union_state</code> is <a href="https://pub.dev/packages/union_state"><img style="vertical-align:middle;" src="https://img.shields.io/pub/v/union_state.svg" alt="union_state version"></a>.</p>

## Changelog

All notable changes to this project will be documented in [this file](./CHANGELOG.md).

## Issues

To report your issues,  submit them directly in the [Issues](https://github.com/surfstudio/flutter-union-state/issues) section.

## Contribute

If you would like to contribute to the package (e.g. by improving the documentation, fixing a bug or adding a cool new feature), please read our [contribution guide](./CONTRIBUTING.md) first and send us your pull request.

Your PRs are always welcome.

## How to reach us

Please feel free to ask any questions about this package. Join our community chat on Telegram. We speak English and Russian.

[![Telegram](https://img.shields.io/badge/chat-on%20Telegram-blue.svg)](https://t.me/SurfGear)

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
