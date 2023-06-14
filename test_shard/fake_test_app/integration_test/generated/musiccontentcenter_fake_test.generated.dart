/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:fake_test_app/main.dart' as app;
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

void musicContentCenterSmokeTestCases() {
  testWidgets(
    'initialize',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String configurationAppId = "hello";
        const String configurationToken = "hello";
        const int configurationMccUid = 10;
        const int configurationMaxCacheSize = 10;
        const MusicContentCenterConfiguration configuration =
            MusicContentCenterConfiguration(
          appId: configurationAppId,
          token: configurationToken,
          mccUid: configurationMccUid,
          maxCacheSize: configurationMaxCacheSize,
        );
        await musicContentCenter.initialize(
          configuration,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[initialize] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'renewToken',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String token = "hello";
        await musicContentCenter.renewToken(
          token,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[renewToken] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'release',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        await musicContentCenter.release();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[release] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'registerEventHandler',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        final MusicContentCenterEventHandler eventHandler =
            MusicContentCenterEventHandler(
          onMusicChartsResult: (String requestId, List result,
              MusicContentCenterStatusCode errorCode) {},
          onMusicCollectionResult: (String requestId, MusicCollection result,
              MusicContentCenterStatusCode errorCode) {},
          onLyricResult: (String requestId, int songCode, String lyricUrl,
              MusicContentCenterStatusCode errorCode) {},
          onSongSimpleInfoResult: (String requestId, int songCode,
              String simpleInfo, MusicContentCenterStatusCode errorCode) {},
          onPreLoadEvent: (String requestId,
              int songCode,
              int percent,
              String lyricUrl,
              PreloadStatusCode status,
              MusicContentCenterStatusCode errorCode) {},
        );
        musicContentCenter.registerEventHandler(
          eventHandler,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[registerEventHandler] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'unregisterEventHandler',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        musicContentCenter.unregisterEventHandler();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[unregisterEventHandler] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getMusicCharts',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        await musicContentCenter.getMusicCharts();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getMusicCharts] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getMusicCollectionByMusicChartId',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int musicChartId = 10;
        const int page = 10;
        const int pageSize = 10;
        const String jsonOption = "hello";
        await musicContentCenter.getMusicCollectionByMusicChartId(
          musicChartId: musicChartId,
          page: page,
          pageSize: pageSize,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint(
              '[getMusicCollectionByMusicChartId] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'searchMusic',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String keyWord = "hello";
        const int page = 10;
        const int pageSize = 10;
        const String jsonOption = "hello";
        await musicContentCenter.searchMusic(
          keyWord: keyWord,
          page: page,
          pageSize: pageSize,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[searchMusic] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'preload',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.preload(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[preload] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'removeCache',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.removeCache(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[removeCache] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getCaches',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int cacheInfoSize = 10;
        await musicContentCenter.getCaches(
          cacheInfoSize,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getCaches] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'isPreloaded',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.isPreloaded(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[isPreloaded] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getLyric',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        const int lyricType = 10;
        await musicContentCenter.getLyric(
          songCode: songCode,
          lyricType: lyricType,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getLyric] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getSongSimpleInfo',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.getSongSimpleInfo(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getSongSimpleInfo] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getInternalSongCode',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        const String jsonOption = "hello";
        await musicContentCenter.getInternalSongCode(
          songCode: songCode,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getInternalSongCode] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );
}

