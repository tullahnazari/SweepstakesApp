import 'dart:io';

import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/providers/ads.dart';
import 'package:sweepstakes/providers/result.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/results_screen.dart';
import 'package:sweepstakes/widgets/animation.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'adPage.dart';

Ads ads;

class SweepstakesDetail extends StatefulWidget {
  const SweepstakesDetail({this.initOption, Key key}) : super(key: key);

  final int initOption;
  static const routeName = '/sweepstakedetail';

  static final double containerHeight = 300.0;

  @override
  _SweepstakesDetailState createState() =>
      _SweepstakesDetailState(initOption: initOption);
}

class _SweepstakesDetailState extends State<SweepstakesDetail> {
  _SweepstakesDetailState({this.initOption = 1});
  final int initOption;
  int _coins = 0;

  final String appId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544~3347511713'
      : 'ca-app-pub-3940256099942544~1458002511';
  final String bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  final String screenUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  final String videoUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  @override
  void initState() {
    super.initState();

    switch (initOption) {
      case 1:

        /// Assign a listener.
        var eventListener = (MobileAdEvent event) {
          if (event == MobileAdEvent.clicked) {
            print("The opened ad is clicked on.");
          }
        };

        ads = Ads(
          appId,
          bannerUnitId: bannerUnitId,
          screenUnitId: screenUnitId,
          videoUnitId: videoUnitId,
          keywords: <String>['ibm', 'computers'],
          contentUrl: 'http://www.ibm.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          testing: false,
          listener: eventListener,
        );

        break;

      case 2:
        ads = Ads(appId);

        /// Assign the listener.
        var eventListener = (MobileAdEvent event) {
          if (event == MobileAdEvent.closed) {
            print("User has opened and now closed the ad.");
          }
        };

        ads.setBannerAd(
          adUnitId: bannerUnitId,
          size: AdSize.banner,
          keywords: ['andriod, flutter'],
          contentUrl: 'http://www.andrioussolutions.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          listener: eventListener,
        );

        ads.setFullScreenAd(
            adUnitId: screenUnitId,
            keywords: ['dart', 'flutter'],
            contentUrl: 'http://www.fluttertogo.com',
            childDirected: false,
            testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
            listener: (MobileAdEvent event) {
              if (event == MobileAdEvent.opened) {
                print("An ad has opened up.");
              }
            });

        var videoListener = (RewardedVideoAdEvent event,
            {String rewardType, int rewardAmount}) {
          if (event == RewardedVideoAdEvent.rewarded) {
            print("The video ad has been rewarded.");
          }
        };

        ads.setVideoAd(
          adUnitId: videoUnitId,
          keywords: ['dart', 'java'],
          contentUrl: 'http://www.publang.org',
          childDirected: true,
          testDevices: null,
          listener: videoListener,
        );

        break;

      case 3:
        ads = Ads(appId);

        /// Assign the listener.
        var eventListener = (MobileAdEvent event) {
          if (event == MobileAdEvent.closed) {
            print("User has opened and now closed the ad.");
          }
        };

        /// You just show the Banner, Fullscreen and Video Ads separately.

        ads.showBannerAd(
          adUnitId: bannerUnitId,
          size: AdSize.banner,
          keywords: ['andriod, flutter'],
          contentUrl: 'http://www.andrioussolutions.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          listener: eventListener,
        );

        ads.showFullScreenAd(
            adUnitId: screenUnitId,
            keywords: ['dart', 'flutter'],
            contentUrl: 'http://www.fluttertogo.com',
            childDirected: false,
            testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
            listener: (MobileAdEvent event) {
              if (event == MobileAdEvent.opened) {
                print("An ad has opened up.");
              }
            });

        var videoListener = (RewardedVideoAdEvent event,
            {String rewardType, int rewardAmount}) {
          if (event == RewardedVideoAdEvent.rewarded) {
            print("The video ad has been rewarded.");
          }
        };

        ads.showVideoAd(
          adUnitId: videoUnitId,
          keywords: ['dart', 'java'],
          contentUrl: 'http://www.publang.org',
          childDirected: true,
          testDevices: null,
          listener: videoListener,
        );

        break;

      default:
        ads = Ads(appId, testing: true);
    }

    ads.eventListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          print("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          print("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          print("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          print("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          print("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          print("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          print("You've closed the Ad and returned to the app.");
          break;
        default:
          print("There's a 'new' MobileAdEvent?!");
      }
    };

    MobileAdListener eventHandler = (MobileAdEvent event) {
      print("This is an event handler.");
    };

    ads.bannerListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          print("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          print("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          print("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          print("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          print("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          print("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          print("You've closed the Ad and returned to the app.");
          break;
        default:
          print("There's a 'new' MobileAdEvent?!");
      }
    };

    ads.removeBanner(eventHandler);

    ads.removeEvent(eventHandler);

    ads.removeScreen(eventHandler);

    ads.screenListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          print("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          print("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          print("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          print("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          print("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          print("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          print("You've closed the Ad and returned to the app.");
          break;
        default:
          print("There's a 'new' MobileAdEvent?!");
      }
    };

    ads.videoListener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      switch (event) {
        case RewardedVideoAdEvent.loaded:
          print("An ad has loaded successfully in memory.");
          break;
        case RewardedVideoAdEvent.failedToLoad:
          print("The ad failed to load into memory.");
          break;
        case RewardedVideoAdEvent.opened:
          print("The ad is now open.");
          break;
        case RewardedVideoAdEvent.leftApplication:
          print("You've left the app after clicking the Ad.");
          break;
        case RewardedVideoAdEvent.closed:
          print("You've closed the Ad and returned to the app.");
          break;
        case RewardedVideoAdEvent.rewarded:
          print("The ad has sent a reward amount.");
          break;
        case RewardedVideoAdEvent.started:
          print("You've just started playing the Video ad.");
          break;
        case RewardedVideoAdEvent.completed:
          print("You've just finished playing the Video ad.");
          break;
        default:
          print("There's a 'new' RewardedVideoAdEvent?!");
      }
    };

    VoidCallback handlerFunc = () {
      print("The opened ad was clicked on.");
    };

    ads.banner.loadedListener = () {
      print("An ad has loaded successfully in memory.");
    };

    ads.banner.removeLoaded(handlerFunc);

    ads.banner.failedListener = () {
      print("An ad failed to load into memory.");
    };

    ads.banner.removeFailed(handlerFunc);

    ads.banner.clickedListener = () {
      print("The opened ad is clicked on.");
    };

    ads.banner.removeClicked(handlerFunc);

    ads.banner.impressionListener = () {
      print("The user is still looking at the ad. A new ad came up.");
    };

    ads.banner.removeImpression(handlerFunc);

    ads.banner.openedListener = () {
      print("You've closed an ad and returned to your app.");
    };

    ads.banner.removeOpened(handlerFunc);

    ads.banner.leftAppListener = () {
      print("You left the app and gone to the ad's website.");
    };

    ads.banner.removeLeftApp(handlerFunc);

    ads.banner.closedListener = () {
      print("You've closed an ad and returned to your app.");
    };

    ads.banner.removeClosed(handlerFunc);

    ads.screen.loadedListener = () {
      print("An ad has loaded into memory.");
    };

    ads.screen.removeLoaded(handlerFunc);

    ads.screen.failedListener = () {
      print("An ad has failed to load in memory.");
    };

    ads.screen.removeFailed(handlerFunc);

    ads.screen.clickedListener = () {
      print("The opened ad was clicked on.");
    };

    ads.screen.removeClicked(handlerFunc);

    ads.screen.impressionListener = () {
      print("You've clicked on a link in the open ad.");
    };

    ads.screen.removeImpression(handlerFunc);

    ads.screen.openedListener = () {
      print("The ad has opened.");
    };

    ads.screen.removeOpened(handlerFunc);

    ads.screen.leftAppListener = () {
      print("The user has left the app and gone to the opened ad.");
    };

    ads.screen.leftAppListener = handlerFunc;

    ads.screen.closedListener = () {
      print("The ad has been closed. The user returns to the app.");
    };

    ads.screen.removeClosed(handlerFunc);

    ads.video.loadedListener = () {
      print("An ad has loaded in memory.");
    };

    ads.video.removeLoaded(handlerFunc);

    ads.video.failedListener = () {
      print("An ad has failed to load in memory.");
    };

    ads.video.removeFailed(handlerFunc);

    ads.video.clickedListener = () {
      print("An ad has been clicked on.");
    };

    ads.video.removeClicked(handlerFunc);

    ads.video.openedListener = () {
      print("An ad has been opened.");
    };

    ads.video.removeOpened(handlerFunc);

    ads.video.leftAppListener = () {
      print("You've left the app to view the video.");
    };

    ads.video.leftAppListener = handlerFunc;

    ads.video.closedListener = () {
      print("The video has been closed.");
    };

    ads.video.removeClosed(handlerFunc);

    ads.video.rewardedListener = (String rewardType, int rewardAmount) {
      print("The ad was sent a reward amount.");
      setState(() {
        _coins += rewardAmount;
      });
    };

    RewardListener rewardHandler = (String rewardType, int rewardAmount) {
      print("This is the Rewarded Video handler");
    };

    ads.video.removeRewarded(rewardHandler);

    ads.video.startedListener = () {
      print("You've just started playing the Video ad.");
    };

    ads.video.removeStarted(handlerFunc);

    ads.video.completedListener = () {
      print("You've just finished playing the Video ad.");
    };

    ads.video.removeCompleted(handlerFunc);

    // Uncomment and run this example
//    List<String> one = ads.keywords;
//
//    String two = ads.contentUrl;
//
//    bool three = ads.childDirected;
//
//    List<String> four = ads.testDevices;
//
//    bool five = ads.initialized;
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
  }

  double clipHeight = SweepstakesDetail.containerHeight * 0.35;

  DiagonalPosition position = DiagonalPosition.BOTTOM_LEFT;

  @override
  Widget build(BuildContext context) {
    final sweepstakeId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweepstake =
        Provider.of<Sweepstakes>(context).findById(sweepstakeId);
    final result = Provider.of<Result>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        loadedSweepstake.title,
        style: TextStyle(color: Theme.of(context).accentColor),
      )),
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Diagonal(
                clipShadows: [ClipShadow(color: Colors.black)],
                position: position,
                clipHeight: clipHeight,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 500,
                ),
              ),
              Positioned(
                bottom: 220.0,
                right: 0.0,
                left: 0.0,
                height: 350.0,
                child: AspectRatio(
                  aspectRatio: 300 / 145,
                  child: AnimationWidget(),
                ),
              ),
              Positioned(
                bottom: -0.0,
                right: 0.0,
                left: 0.0,
                height: 230.0,
                child: AspectRatio(
                  aspectRatio: 300 / 145,
                  child: Image.network(
                    loadedSweepstake.imageUrl,
                  ),
                ),
              ),
              Positioned(
                bottom: -260.0,
                right: 0.0,
                left: 0.0,
                height: 250.0,
                child: AspectRatio(
                  aspectRatio: 300 / 145,
                  child: Text(
                    '\$${loadedSweepstake.price.toString()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 125,
          ),
          RaisedButton(
            child: Text('Enter to Win'),
            onPressed: () {
              // setState(() {
              //   if (position == DiagonalPosition.BOTTOM_LEFT) {
              //     position = DiagonalPosition.BOTTOM_RIGHT;
              //   } else {
              //     position = DiagonalPosition.BOTTOM_LEFT;
              //   }
              // });
              ads.showVideoAd(state: this);

              result.addItem(loadedSweepstake.id, loadedSweepstake.randomNumber,
                  loadedSweepstake.title);
              Navigator.of(context).pushNamed(ResultScreen.routeName);
            },
          ),
          RaisedButton(
            child: Text('View Restrictions'),
            onPressed: () {
              // setState(() {
              //   if (clipHeight == containerHeight * 0.35) {
              //     clipHeight = containerHeight * 0.10;
              //   } else {
              //     clipHeight = containerHeight * 0.35;
              //   }
              // });
            },
          )
        ],
      ),
    );
  }
}
