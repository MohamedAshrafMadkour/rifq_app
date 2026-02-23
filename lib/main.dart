import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sakina_app/core/helper/shared_prefs.dart';
import 'package:sakina_app/core/manager/theme_hydrated_cubit.dart';
import 'package:sakina_app/core/notification/notification_bootstrap.dart';
import 'package:sakina_app/core/notification/notification_init.dart';
import 'package:sakina_app/core/service/get_it_setup.dart';
import 'package:sakina_app/core/widgets/app_error_view.dart';
import 'package:sakina_app/features/quran_audio/presentation/manager/audio_cubit.dart';
import 'package:sakina_app/features/quran_audio/presentation/manager/reciter_download/reciter_downloading_cubit.dart';
import 'package:sakina_app/sakina_app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItSetup();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  SharedPref.init();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  await InitNotificationService.initNotification();
  await NotificationBootstrap.init();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Builder(
      builder: (context) {
        return AppErrorView();
      },
    );
  };

  if (kReleaseMode) {
    // runZonedGuarded(
    //   () async {
    //     await SentryFlutter.init(
    //       (options) {
    //         options.dsn = AppKeys.dsnkey;
    //       },
    //     );
    //     runApp(
    //       BlocProvider(
    //         create: (context) => getIt.get<ThemeCubit>(),
    //         child: const SakinaApp(),
    //       ),
    //     );
    //   },
    //   (exception, stackTrace) async {
    //     await Sentry.captureException(exception, stackTrace: stackTrace);
    //   },
    // );
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<ThemeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<AudioCubit>(),
          ),
          BlocProvider(create: (_) => getIt.get<ReciterDownloadingCubit>()),
        ],
        child: const SakinaApp(),
      ),
    );
  } else {
    runApp(
      // child: DevicePreview(builder: (context) => const SakinaApp()),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<ThemeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<AudioCubit>(),
          ),
          BlocProvider(create: (_) => getIt.get<ReciterDownloadingCubit>()),
        ],
        // child: DevicePreview(builder: (context) => const SakinaApp()),
        child: SakinaApp(),
      ),
    );
  }
}
