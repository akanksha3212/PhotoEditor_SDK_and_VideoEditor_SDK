import 'dart:ui';

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoBrushConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [BrushOptions] to configure the brush tool.
    final brushOptions = BrushOptions(
        // By default all available brush tools are enabled.
        // For this example only a couple are enabled.
        // highlight-tools
        actions: [BrushAction.color, BrushAction.size],
        // highlight-tools

        // By default the default color for the brush stroke is
        // `#ffffff`. For this example the default color
        // is set to `#000000`.
        // highlight-color
        defaultColor: const Color(0xFF000000),
        // highlight-color

        // By default the default brush size is set to 5% of the
        // smaller side of the video.
        // For this example the default size is set to be 2.5% of
        // the smaller side of the video.
        // highlight-size
        defaultSize: 0.025,
        // highlight-size

        // By default the editor provides a variety of different
        // colors to customize the color of the brush stroke.
        // For this example only a small selection of colors is enabled.
        // highlight-colors
        colors: ColorPalette(colors: [
          NamedColor(const Color(0xFFFFFFFF), "White"),
          NamedColor(const Color(0xFF000000), "Black"),
          NamedColor(const Color(0xFFFF0000), "Red")
        ])
        // highlight-colors
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(brush: brushOptions);

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    }
  }
}
