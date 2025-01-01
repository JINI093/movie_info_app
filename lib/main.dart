import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/Ui/view_model/detail/detail_view_model.dart';
import 'package:flutter_movie_info_app/Ui/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'ui/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경 설정 검증
  AppConfig.validate();

  // 의존성 초기화
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<HomeViewModel>()..fetchInitialMovies(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<DetailViewModel>(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie Info App',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
