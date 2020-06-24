import 'dart:async';

import 'package:app/models/vehicle.dart';
import 'package:app/services/access_time_left.dart';
import 'package:app/services/mercedes_service.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class VehicleAccessPage extends StatefulWidget {
  const VehicleAccessPage({Key key, this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  _VehicleAccessPageState createState() => _VehicleAccessPageState();
}

class _VehicleAccessPageState extends State<VehicleAccessPage> {
  static bool _engineStarted = false;
  static bool _vehicleUnlocked = false;
  static List<String> _timeUntil = List(1);

  static Timer _timer;
  static bool _disableAccess = false;
  Future<dynamic> _setDoorLocks(command) async {
    dynamic lockStatus =
        await mercedesService.setLockStatus(widget.vehicle.id, command);
    print('lock status $lockStatus');
  }

  void _accessTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        _timeUntil = AccessTimeLeft()
            .timeLeft(new DateTime(now.year, now.month, now.day + 1, 12));
        _disableAccess = (_timeUntil[0] == '0 days 0 hours 0 mins 0 secs');
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accessTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteBacground,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Material(
          color: kWhiteBacground,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomText(
              text: 'Vehicle Access',
              fontSize: 26.0,
              textColour: kSecondaryColour,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 400.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: kWhiteBacground,
                  boxShadow: [
                    BoxShadow(color: kSecondaryColour, spreadRadius: 0.5),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Time Remaining'),
                      CustomText(
                        text: _timeUntil[0] ?? "loading...",
                        alignment: Alignment.center,
                        textColour: kTertiaryColour,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _engineStarted == false
                  ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _disableAccess == false && _vehicleUnlocked == true
                          ? () {
                              setState(() {
                                _engineStarted = !_engineStarted;
                              });
                            }
                          : null,
                      child: Image.asset('lib/assets/stop-btn.png'),
                    )
                  : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _disableAccess == false && _vehicleUnlocked == true
                          ? () {
                              setState(() {
                                _engineStarted = !_engineStarted;
                              });
                            }
                          : null,
                      child: Image.asset('lib/assets/start-btn.png'),
                    ),
              SizedBox(
                height: 20.0,
              ),
              _vehicleUnlocked == false
                  ? CustomText(
                      text: 'Vehicle Locked',
                      textColour: kBlackText,
                      fontSize: 20.0,
                      alignment: Alignment.center,
                      fontWeight: FontWeight.bold,
                    )
                  : CustomText(
                      text: 'Vehicle Unlocked',
                      textColour: kBlackText,
                      fontSize: 20.0,
                      alignment: Alignment.center,
                      fontWeight: FontWeight.bold,
                    ),
              _vehicleUnlocked == false
                  ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _disableAccess == false
                          ? () async {
                              await _setDoorLocks("{ \"command\": \"UNLOCK\"}");
                              setState(() {
                                _vehicleUnlocked = !_vehicleUnlocked;
                              });
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('lib/assets/blue-lock-btn.png'),
                        ],
                      ),
                    )
                  : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _disableAccess == false
                          ? () async {
                              await _setDoorLocks("{ \"command\": \"LOCK\"}");
                              setState(() {
                                _vehicleUnlocked = !_vehicleUnlocked;
                              });
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('lib/assets/blue-unlock-btn.png'),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
