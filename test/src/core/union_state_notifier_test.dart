import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:union_state/union_state.dart';

class MockData {}

class MockException extends Mock implements Exception {}

void main() {
  group('Initialization: ', () {
    test('Should set initial state to content', () {
      final data = MockData();
      final notifier = UnionStateNotifier<MockData>(data);
      expect(
        notifier.value,
        equals(UnionStateContent<MockData>(data)),
      );
    });
  });

  group('UnionStateNotifier.loading: ', () {
    test('should set state to loading', () {
      final notifier = UnionStateNotifier<MockData>.loading();
      expect(
        notifier.value,
        equals(const UnionStateLoading<MockData>()),
      );
    });

    test('should set state to loading with previous data', () {
      final data = MockData();
      final notifier = UnionStateNotifier<MockData>.loading(data);
      expect(
        notifier.value,
        equals(UnionStateLoading<MockData>(data)),
      );
    });
  });

  group('UnionStateNotifier.failure: ', () {
    test('should set state to failure', () {
      final failure = MockException();
      final notifier = UnionStateNotifier<MockData>.failure(failure);
      expect(
        notifier.value,
        equals(UnionStateFailure<MockData>(failure)),
      );
    });

    test('should set state to failure with previous data', () {
      final data = MockData();
      final failure = MockException();
      final notifier = UnionStateNotifier<MockData>.failure(failure, data);
      expect(
        notifier.value,
        equals(UnionStateFailure<MockData>(failure, data)),
      );
    });
  });

  group('UnionStateNotifier.content: ', () {
    test('should set state to content', () {
      final data = MockData();
      final notifier = UnionStateNotifier<MockData>(data)..content(data);
      expect(
        notifier.value,
        equals(UnionStateContent<MockData>(data)),
      );
    });
  });
}
