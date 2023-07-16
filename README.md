# UnionState

The package includes the following classes:

## UnionState
A universal model for mapping basic UI states.

Internal replacement for [EntityState]. Unlike [EntityState]:
 * Guarantees a non-zero result [T].
 * Explicitly guarantees only 3 states: loading, content, error.

## UnionStateListenableBuilder

Presentation part builder for [ValueListenable] and [UnionState].

## UnionStateNotifier

Internal replacement for [EntityStateNotifier]. Unlike [EntityState]:
 * Guarantees a non-zero result [T].
 * Explicitly guarantees only 3 states: loading, content, failure.

## Failure
Error handled in the application's binary logic layer. This is expected to be the only kind of error we can get

### Implementation examples

[An example](https://github.com/surfstudio/flutter-union-state)