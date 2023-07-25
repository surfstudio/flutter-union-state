import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:union_state/union_state.dart';

class MockData {}

class MockException extends Mock implements Exception {}

void main() {
  Widget wrapper(Widget child) => Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      );

  group('UnionStateListenableBuilder', () {
    testWidgets('should call builder when state is content', (tester) async {
      final data = MockData();
      final unionStateListenable = ValueNotifier<UnionState<MockData>>(
        UnionStateContent<MockData>(data),
      );
      const content = 'content';
      Widget builder(context, data) => const Text(content);

      await tester.pumpWidget(
        wrapper(
          UnionStateListenableBuilder<MockData>(
            unionStateListenable: unionStateListenable,
            builder: builder,
            loadingBuilder: (context, data) => Container(),
            failureBuilder: (context, failure, data) => Container(),
          ),
        ),
      );

      expect(find.widgetWithText(Directionality, content), findsOneWidget);
    });

    testWidgets('should call loadingBuilder when state is loading',
        (tester) async {
      final data = MockData();
      final unionStateListenable = ValueNotifier<UnionState<MockData>>(
        UnionStateLoading<MockData>(data),
      );
      const loading = 'loading';

      Widget loadingBuilder(context, data) => const Text(loading);

      await tester.pumpWidget(
        wrapper(
          UnionStateListenableBuilder<MockData>(
            unionStateListenable: unionStateListenable,
            builder: (context, data) => Container(),
            loadingBuilder: loadingBuilder,
            failureBuilder: (context, failure, data) => Container(),
          ),
        ),
      );

      expect(find.widgetWithText(Directionality, loading), findsOneWidget);
    });

    testWidgets('should call failureBuilder when state is failure',
        (tester) async {
      final exception = MockException();
      final data = MockData();
      final unionStateListenable = ValueNotifier<UnionState<MockData>>(
        UnionStateFailure<MockData>(exception, data),
      );

      const failureData = 'failure';

      Widget failureBuilder(context, failure, data) => const Text(failureData);

      await tester.pumpWidget(
        wrapper(
          UnionStateListenableBuilder<MockData>(
            unionStateListenable: unionStateListenable,
            builder: (context, data) => Container(),
            loadingBuilder: (context, data) => Container(),
            failureBuilder: failureBuilder,
          ),
        ),
      );

      expect(find.widgetWithText(Directionality, failureData), findsOneWidget);
    });
  });
}
