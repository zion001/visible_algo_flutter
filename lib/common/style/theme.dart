
/*import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284831119),
      surfaceTint: Color(4284960932),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293582335),
      onPrimaryContainer: Color(4280352861),
      secondary: Color(4284636017),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293451512),
      onSecondaryContainer: Color(4280097067),
      tertiary: Color(4286403168),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957284),
      onTertiaryContainer: Color(4281405725),
      error: Color(4289930782),
      onError: Color(4294967295),
      errorContainer: Color(4294565596),
      onErrorContainer: Color(4282453515),
      background: Color(4294899711),
      onBackground: Color(4280097568),
      surface: Color(4294899711),
      onSurface: Color(4280097568),
      surfaceVariant: Color(4293386476),
      onSurfaceVariant: Color(4282991951),
      outline: Color(4286149758),
      outlineVariant: Color(4291478736),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294307831),
      inversePrimary: Color(4291869951),
      primaryFixed: Color(4293582335),
      onPrimaryFixed: Color(4280352861),
      primaryFixedDim: Color(4291869951),
      onPrimaryFixedVariant: Color(4283381643),
      secondaryFixed: Color(4293451512),
      onSecondaryFixed: Color(4280097067),
      secondaryFixedDim: Color(4291609308),
      onSecondaryFixedVariant: Color(4283057240),
      tertiaryFixed: Color(4294957284),
      onTertiaryFixed: Color(4281405725),
      tertiaryFixedDim: Color(4293900488),
      onTertiaryFixedVariant: Color(4284693320),
      surfaceDim: Color(4292794593),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294176247),
      surfaceContainerHigh: Color(4293715696),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282988913),
      surfaceTint: Color(4284831119),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286278567),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282988913),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286344103),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285214533),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289027959),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411116),
      onError: Color(4294967295),
      errorContainer: Color(4289355610),
      onErrorContainer: Color(4294967295),
      background: Color(4294834175),
      onBackground: Color(4280097568),
      surface: Color(4294834175),
      onSurface: Color(4280097568),
      surfaceVariant: Color(4293386475),
      onSurfaceVariant: Color(4282728778),
      outline: Color(4284570983),
      outlineVariant: Color(4286413187),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294307831),
      inversePrimary: Color(4291804670),
      primaryFixed: Color(4286278567),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284633996),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286344103),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284633996),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289027959),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287186782),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294834175),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505210),
      surfaceContainer: Color(4294110452),
      surfaceContainerHigh: Color(4293715694),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280751950),
      surfaceTint: Color(4284831119),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282988913),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280751950),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282988913),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282519076),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285214533),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650382),
      onError: Color(4294967295),
      errorContainer: Color(4285411116),
      onErrorContainer: Color(4294967295),
      background: Color(4294834175),
      onBackground: Color(4280097568),
      surface: Color(4294834175),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293386475),
      onSurfaceVariant: Color(4280623915),
      outline: Color(4282728778),
      outlineVariant: Color(4282728778),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294043903),
      primaryFixed: Color(4282988913),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281475929),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282988913),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281475929),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285214533),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283439407),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294834175),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505210),
      surfaceContainer: Color(4294110452),
      surfaceContainerHigh: Color(4293715694),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291869950),
      surfaceTint: Color(4291869951),
      onPrimary: Color(4281867890),
      primaryContainer: Color(4283381643),
      onPrimaryContainer: Color(4293582335),
      secondary: Color(4291609308),
      onSecondary: Color(4281544001),
      secondaryContainer: Color(4283057240),
      onSecondaryContainer: Color(4293451512),
      tertiary: Color(4293900488),
      onTertiary: Color(4282983730),
      tertiaryContainer: Color(4284693320),
      onTertiaryContainer: Color(4294957284),
      error: Color(4294097077),
      onError: Color(4284486672),
      errorContainer: Color(4287372568),
      onErrorContainer: Color(4294565596),
      background: Color(4279505432),
      onBackground: Color(4293320937),
      surface: Color(4279505432),
      onSurface: Color(4293320937),
      surfaceVariant: Color(4282991951),
      onSurfaceVariant: Color(4291478736),
      outline: Color(4287860633),
      outlineVariant: Color(4282991951),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293320937),
      inverseOnSurface: Color(4281478965),
      inversePrimary: Color(4284960932),
      primaryFixed: Color(4293582335),
      onPrimaryFixed: Color(4280352861),
      primaryFixedDim: Color(4291869951),
      onPrimaryFixedVariant: Color(4283381643),
      secondaryFixed: Color(4293451512),
      onSecondaryFixed: Color(4280097067),
      secondaryFixedDim: Color(4291609308),
      onSecondaryFixedVariant: Color(4283057240),
      tertiaryFixed: Color(4294957284),
      onTertiaryFixed: Color(4281405725),
      tertiaryFixedDim: Color(4293900488),
      onTertiaryFixedVariant: Color(4284693320),
      surfaceDim: Color(4279505432),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360742),
      surfaceContainerHigh: Color(4281018672),
      surfaceContainerHighest: Color(4281742395),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4292067839),
      surfaceTint: Color(4291804670),
      onPrimary: Color(4279961922),
      primaryContainer: Color(4288186309),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292067839),
      onSecondary: Color(4279961922),
      secondaryContainer: Color(4288186309),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294948813),
      onTertiary: Color(4281532952),
      tertiaryContainer: Color(4291132307),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949299),
      onError: Color(4281533445),
      errorContainer: Color(4291591028),
      onErrorContainer: Color(4278190080),
      background: Color(4279505432),
      onBackground: Color(4293320937),
      surface: Color(4279505432),
      onSurface: Color(4294965759),
      surfaceVariant: Color(4282991950),
      onSurfaceVariant: Color(4291741908),
      outline: Color(4289110443),
      outlineVariant: Color(4287005067),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293320937),
      inverseOnSurface: Color(4281018671),
      inversePrimary: Color(4283318135),
      primaryFixed: Color(4293516799),
      onPrimaryFixed: Color(4279632701),
      primaryFixedDim: Color(4291804670),
      onPrimaryFixedVariant: Color(4282133859),
      secondaryFixed: Color(4293516799),
      onSecondaryFixed: Color(4279632701),
      secondaryFixedDim: Color(4291804670),
      onSecondaryFixedVariant: Color(4282133859),
      tertiaryFixed: Color(4294957539),
      onTertiaryFixed: Color(4281008147),
      tertiaryFixedDim: Color(4294947017),
      onTertiaryFixedVariant: Color(4284162616),
      surfaceDim: Color(4279505432),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294965759),
      surfaceTint: Color(4291804670),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292067839),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965759),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292067839),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294948813),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949299),
      onErrorContainer: Color(4278190080),
      background: Color(4279505432),
      onBackground: Color(4293320937),
      surface: Color(4279505432),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282991950),
      onSurfaceVariant: Color(4294965759),
      outline: Color(4291741908),
      outlineVariant: Color(4291741908),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293320937),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4281278550),
      primaryFixed: Color(4293780223),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292067839),
      onPrimaryFixedVariant: Color(4279961922),
      secondaryFixed: Color(4293780223),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292067839),
      onSecondaryFixedVariant: Color(4279961922),
      tertiaryFixed: Color(4294959079),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294948813),
      onTertiaryFixedVariant: Color(4281532952),
      surfaceDim: Color(4279505432),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

*/

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283196971),
      surfaceTint: Color(4283196971),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291685795),
      onPrimaryContainer: Color(4279246848),
      secondary: Color(4283982409),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292667336),
      onSecondaryContainer: Color(4279574027),
      tertiary: Color(4281886307),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290571495),
      onTertiaryContainer: Color(4278198302),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294572783),
      onSurface: Color(4279901206),
      onSurfaceVariant: Color(4282665021),
      outline: Color(4285888876),
      outlineVariant: Color(4291152058),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282858),
      inversePrimary: Color(4289843594),
      primaryFixed: Color(4291685795),
      onPrimaryFixed: Color(4279246848),
      primaryFixedDim: Color(4289843594),
      onPrimaryFixedVariant: Color(4281683478),
      secondaryFixed: Color(4292667336),
      onSecondaryFixed: Color(4279574027),
      secondaryFixedDim: Color(4290759597),
      onSecondaryFixedVariant: Color(4282403379),
      tertiaryFixed: Color(4290571495),
      onTertiaryFixed: Color(4278198302),
      tertiaryFixedDim: Color(4288729291),
      onTertiaryFixedVariant: Color(4280241739),
      surfaceDim: Color(4292533200),
      surfaceBright: Color(4294572783),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178025),
      surfaceContainer: Color(4293849059),
      surfaceContainerHigh: Color(4293454302),
      surfaceContainerHighest: Color(4293059544),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281420306),
      surfaceTint: Color(4283196971),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284579135),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282140207),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285429854),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279913031),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283399545),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572783),
      onSurface: Color(4279901206),
      onSurfaceVariant: Color(4282401849),
      outline: Color(4284309845),
      outlineVariant: Color(4286086256),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282858),
      inversePrimary: Color(4289843594),
      primaryFixed: Color(4284579135),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282999849),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285429854),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283785031),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283399545),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281754720),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292533200),
      surfaceBright: Color(4294572783),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178025),
      surfaceContainer: Color(4293849059),
      surfaceContainerHigh: Color(4293454302),
      surfaceContainerHighest: Color(4293059544),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279510784),
      surfaceTint: Color(4283196971),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281420306),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280034577),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282140207),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200101),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279913031),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572783),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362268),
      outline: Color(4282401849),
      outlineVariant: Color(4282401849),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282858),
      inversePrimary: Color(4292278188),
      primaryFixed: Color(4281420306),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280038144),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282140207),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280692763),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279913031),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203185),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292533200),
      surfaceBright: Color(4294572783),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178025),
      surfaceContainer: Color(4293849059),
      surfaceContainerHigh: Color(4293454302),
      surfaceContainerHighest: Color(4293059544),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289843594),
      surfaceTint: Color(4289843594),
      onPrimary: Color(4280235777),
      primaryContainer: Color(4281683478),
      onPrimaryContainer: Color(4291685795),
      secondary: Color(4290759597),
      onSecondary: Color(4280955678),
      secondaryContainer: Color(4282403379),
      onSecondaryContainer: Color(4292667336),
      tertiary: Color(4288729291),
      onTertiary: Color(4278204213),
      tertiaryContainer: Color(4280241739),
      onTertiaryContainer: Color(4290571495),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374862),
      onSurface: Color(4293059544),
      onSurfaceVariant: Color(4291152058),
      outline: Color(4287599237),
      outlineVariant: Color(4282665021),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059544),
      inversePrimary: Color(4283196971),
      primaryFixed: Color(4291685795),
      onPrimaryFixed: Color(4279246848),
      primaryFixedDim: Color(4289843594),
      onPrimaryFixedVariant: Color(4281683478),
      secondaryFixed: Color(4292667336),
      onSecondaryFixed: Color(4279574027),
      secondaryFixedDim: Color(4290759597),
      onSecondaryFixedVariant: Color(4282403379),
      tertiaryFixed: Color(4290571495),
      onTertiaryFixed: Color(4278198302),
      tertiaryFixedDim: Color(4288729291),
      onTertiaryFixedVariant: Color(4280241739),
      surfaceDim: Color(4279374862),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279901206),
      surfaceContainer: Color(4280164378),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546286),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290106766),
      surfaceTint: Color(4289843594),
      onPrimary: Color(4278983168),
      primaryContainer: Color(4286421593),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291088305),
      onSecondary: Color(4279245063),
      secondaryContainer: Color(4287272313),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288992464),
      onTertiary: Color(4278196761),
      tertiaryContainer: Color(4285241749),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374862),
      onSurface: Color(4294704368),
      onSurfaceVariant: Color(4291415230),
      outline: Color(4288783511),
      outlineVariant: Color(4286678392),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059544),
      inversePrimary: Color(4281749271),
      primaryFixed: Color(4291685795),
      onPrimaryFixed: Color(4278719488),
      primaryFixedDim: Color(4289843594),
      onPrimaryFixedVariant: Color(4280630533),
      secondaryFixed: Color(4292667336),
      onSecondaryFixed: Color(4278916099),
      secondaryFixedDim: Color(4290759597),
      onSecondaryFixedVariant: Color(4281350436),
      tertiaryFixed: Color(4290571495),
      onTertiaryFixed: Color(4278195219),
      tertiaryFixedDim: Color(4288729291),
      onTertiaryFixedVariant: Color(4278730042),
      surfaceDim: Color(4279374862),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279901206),
      surfaceContainer: Color(4280164378),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546286),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294246367),
      surfaceTint: Color(4289843594),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290106766),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294246367),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291088305),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293591036),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288992464),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374862),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294573293),
      outline: Color(4291415230),
      outlineVariant: Color(4291415230),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059544),
      inversePrimary: Color(4279906304),
      primaryFixed: Color(4291949223),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290106766),
      onPrimaryFixedVariant: Color(4278983168),
      secondaryFixed: Color(4292930508),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291088305),
      onSecondaryFixedVariant: Color(4279245063),
      tertiaryFixed: Color(4290834668),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288992464),
      onTertiaryFixedVariant: Color(4278196761),
      surfaceDim: Color(4279374862),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279901206),
      surfaceContainer: Color(4280164378),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546286),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
