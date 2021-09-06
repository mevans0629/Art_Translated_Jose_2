import 'package:art_translated/components/translate_label.dart';
import 'package:flutter_test/flutter_test.dart';

void testTranslateLabel() {
  dynamic _onTextTouched(bool test) {}

  testWidgets('Test translate text building', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TranslateLabel(
      label: "Enter Text",
      onTextTouched: _onTextTouched,
    ));
  });
}
