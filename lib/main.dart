import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/state/language_provider.dart';
import 'package:news_app/core/state/theme_provider.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/news/presentation/ui/pages/search_page.dart';
import 'package:provider/provider.dart';

import 'core/storage/cache_helper.dart';
import 'features/news/presentation/state/news_provider.dart';
import 'features/news/presentation/state/sources_provider.dart';
import 'features/news/presentation/ui/pages/home_page.dart';
import 'features/news/presentation/ui/pages/news_page.dart';
import 'l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  final languageProvider = LanguageProvider();
  await languageProvider.loadLocale();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("ENV ERROR: $e");
  }
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: themeProvider),
            ChangeNotifierProvider.value(value: languageProvider),
            ChangeNotifierProvider(create: (context) => SourcesProvider()),
            ChangeNotifierProvider(create: (context) => NewsProvider()),
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: languageProvider.language,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        NewsPage.routeName: (context) => NewsPage(),
        SearchPage.routeName: (context) => SearchPage()
      },
      initialRoute: HomePage.routeName,
    );
  }
}

