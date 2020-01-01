import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/models/sweepstake.dart';
import 'package:sweepstakes/providers/result.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/results_screen.dart';
import 'package:sweepstakes/widgets/animation.dart';
import 'package:firebase_admob/firebase_admob.dart';

const testDevices = "";

class SweepstakesDetail extends StatefulWidget {
  //final int initOption;
  static const routeName = '/sweepstakedetail';

  static final double containerHeight = 300.0;

  @override
  _SweepstakesDetailState createState() => _SweepstakesDetailState();
}

class _SweepstakesDetailState extends State<SweepstakesDetail> {
  _SweepstakesDetailState();

  static const MobileAdTargetingInfo targetinginfo = MobileAdTargetingInfo(
    testDevices: testDevices != null ? <String>['testDevices'] : null,
    keywords: <String>['Book', 'Game'],
    nonPersonalizedAds: true,
  );

  int _coins = 0;
  RewardedVideoAd videoAd = RewardedVideoAd.instance;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    videoAd.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print('The Rewarded video Ad $event');
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
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
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
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
              videoAd.load(
                  adUnitId: RewardedVideoAd.testAdUnitId,
                  targetingInfo: targetinginfo);
              videoAd.show();

              // setState(() {
              //   if (position == DiagonalPosition.BOTTOM_LEFT) {
              //     position = DiagonalPosition.BOTTOM_RIGHT;
              //   } else {
              //     position = DiagonalPosition.BOTTOM_LEFT;
              //   }
              // });
              //ads.showVideoAd(state: this);
              //Future.delayed(const Duration(seconds: 5));

              navigateToNextPage(result, loadedSweepstake, context);
            },
          ),
          RaisedButton(
            child: Text('Load rewarded video ad'),
            onPressed: () {
              videoAd.show();
              // setState(() {
              //   if (clipHeight == containerHeight * 0.35) {
              //     clipHeight = containerHeight * 0.10;
              //   } else {
              //     clipHeight = containerHeight * 0.35;
              //   }
              // });
            },
          ),
          Text("You have $_coins coins"),
        ],
      ),
    );
  }

  Future<void> navigateToNextPage(
      Result result, Sweepstake loadedSweepstake, BuildContext context) async {
    await result.addItem(loadedSweepstake.id, loadedSweepstake.randomNumber,
        loadedSweepstake.title);
    await Navigator.of(context).pushNamed(ResultScreen.routeName);
    print('navigate to next page');
  }
}
