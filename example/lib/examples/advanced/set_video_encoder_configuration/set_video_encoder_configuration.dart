import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:agora_rtc_engine_example/config/agora.config.dart' as config;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// SetVideoEncoderConfiguration Example
class SetVideoEncoderConfiguration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetVideoEncoderConfigurationState();
}

class _SetVideoEncoderConfigurationState
    extends State<SetVideoEncoderConfiguration> {
  late final RtcEngine _engine;
  String channelId = config.channelId;
  bool isJoined = false;
  bool switchCamera = true;
  TextEditingController? _channelIdController;
  int _remoteUid = 0;
  List<VideoDimensions> dimensions = [
    VideoDimensions(width: 640, height: 480),
    VideoDimensions(width: 480, height: 480),
    VideoDimensions(width: 480, height: 240)
  ];
  @override
  void initState() {
    super.initState();
    _channelIdController = TextEditingController(text: channelId);
    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _engine.destroy();
  }

  Future<void> _initEngine() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    this._addListeners();

    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  void _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        debugPrint('warning ${warningCode}');
      },
      error: (errorCode) {
        debugPrint('error ${errorCode}');
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        debugPrint('joinChannelSuccess ${channel} ${uid} ${elapsed}');
        setState(() {
          isJoined = true;
        });
      },
      userJoined: (uid, elapsed) {
        debugPrint('userJoined  ${uid} ${elapsed}');
        if (_remoteUid == 0) {
          setState(() {
            _remoteUid = uid;
          });
        }
      },
      userOffline: (uid, reason) {
        debugPrint('userOffline  ${uid} ${reason}');
        setState(() {
          _remoteUid = 0;
        });
      },
      leaveChannel: (stats) {
        debugPrint('leaveChannel ${stats.toJson()}');
        setState(() {
          isJoined = false;
        });
      },
      rtmpStreamingStateChanged: (String url, RtmpStreamingState state,
          RtmpStreamingErrorCode errCode) {
        debugPrint(
            'rtmpStreamingStateChanged url: $url, state: $state, errCode: $errCode');
      },
      rtmpStreamingEvent: (String url, RtmpStreamingEvent eventCode) {
        debugPrint(
            'rtmpStreamingEvent url: $url, eventCode: ${eventCode.toString()}');
      },
    ));
  }

  Future<void> _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }
    await _engine.joinChannel(config.token, channelId, null, config.uid);
    await setVideoEncoderConfiguration();
  }

  Future<void> _leaveChannel() async {
    await _engine.leaveChannel();
  }

  Future<void> setVideoEncoderConfiguration({int dim = 0}) async {
    if (dim >= dimensions.length) {
      debugPrint("Invalid dimension choice!");
      return;
    }

    VideoEncoderConfiguration config = VideoEncoderConfiguration(
      dimensions: dimensions[dim],
      frameRate: VideoFrameRate.Fps15,
      minFrameRate: VideoFrameRate.Min,
      bitrate: 0,
      minBitrate: 1,
      orientationMode: VideoOutputOrientationMode.Adaptative,
      degradationPrefer: DegradationPreference.MaintainFramerate,
      mirrorMode: VideoMirrorMode.Auto,
    );
    await _engine.setVideoEncoderConfiguration(config);
  }

  void _switchCamera() {
    _engine.switchCamera().then((value) {
      setState(() {
        switchCamera = !switchCamera;
      });
    }).catchError((err) {
      print('switchCamera $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: _channelIdController,
              decoration: InputDecoration(hintText: 'Channel ID'),
              onChanged: (text) {
                setState(() {
                  channelId = text;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed:
                        isJoined ? this._leaveChannel : this._joinChannel,
                    child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                  ),
                )
              ],
            ),
            _renderVideo(),
          ],
        ),
        if (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS)
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: this._switchCamera,
                  child: Text('Camera ${switchCamera ? 'front' : 'rear'}'),
                ),
              ],
            ),
          )
      ],
    );
  }

  Widget _renderVideo() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            child: kIsWeb
                ? RtcLocalView.SurfaceView()
                : RtcLocalView.TextureView(),
          ),
          if (_remoteUid != 0)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                height: 120,
                child: kIsWeb
                    ? RtcRemoteView.SurfaceView(
                        uid: _remoteUid,
                        channelId: channelId,
                      )
                    : RtcRemoteView.TextureView(
                        uid: _remoteUid,
                        channelId: channelId,
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
