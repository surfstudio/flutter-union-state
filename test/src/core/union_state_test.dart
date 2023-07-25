import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:union_state/union_state.dart';

class MockData {}

class MockException extends Mock implements Exception {}

void main() {
  group('UnionState', () {
    group('UnionStateContent: ', () {
      test('should return data', () {
        final data = MockData();
        final state = UnionStateContent<MockData>(data);
        expect(state.data, equals(data));
      });
    });

    group('UnionStateLoading: ', () {
      test('should return data', () {
        final data = MockData();
        final state = UnionStateLoading<MockData>(data);
        expect(state.data, equals(data));
      });
    });

    group('UnionStateFailure: ', () {
      test('should return data and failure', () {
        final data = MockData();
        final exception = MockException();
        final state = UnionStateFailure<MockData>(exception, data);
        expect(state.data, equals(data));
        expect(state.exception, equals(exception));
      });
    });
  });
}
