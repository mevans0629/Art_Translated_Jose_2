import 'package:art_translated/components/action_label.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:flutter_test/flutter_test.dart';

void testTranslateLabel() {
  dynamic _onTextTouched(bool test) {}

  testWidgets('Test translate text building', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ActionLabel(
        text: "Enter Text",
        onTap: _onTextTouched,
        textStyle: Styling.getBodyTextStyle(100)));
  });
}
