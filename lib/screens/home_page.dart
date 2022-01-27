import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofence/geofence.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/select_category_widget.dart';
import 'package:purple_star/screens/deals_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();

  String? myVideoId = YoutubePlayer.convertUrlToId('https://youtu.be/BqbpZkgcaVQ');
  YoutubeMetaData _videoMetaData = const YoutubeMetaData();
 late YoutubePlayerController _controller;

  @override
  void initState(){
    _controller = YoutubePlayerController(
      initialVideoId: myVideoId.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(listener);

    initPlatformState();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS =
    IOSInitializationSettings(onDidReceiveLocalNotification: null);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: null);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    Geofence.initialize();
    Geofence.startListening(GeolocationEvent.entry, (entry) {
      scheduleNotification("Entry of a georegion", "Welcome to: ${entry.id}");
    });

    Geofence.startListening(GeolocationEvent.exit, (entry) {
      scheduleNotification("Exit of a georegion", "Byebye to: ${entry.id}");
    });

    setState(() {});
  }

 void listener() {
     setState(() {
       _videoMetaData = _controller.metadata;
     });
 }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:const AppBarWidget(),

      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                child:  Text(
                    'purple star deals',
                    style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),
                  ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Get.to(() =>const DealsPage());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage('assets/image/deals_4.jpeg'),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: AssetImage('assets/image/deals_2.jpeg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: AssetImage('assets/image/deals_1.jpeg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: AssetImage('assets/image/deals_3.jpeg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),


                  ],
                ),
              ),

//Category
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                    child:
                    Text(
                      'shop by category',
                      style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.15,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        children: List.generate(category.length, (index) {
                          return Center(
                            child: SelectCategory(categoryModel: category[index]),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                 const  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                    child: Text(
                      'video review',
                      style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 200,
                                          child: Text( _videoMetaData.title, style: TextStyle(fontFamily: 'Poppins', fontSize: 15),)),
                                    ),
                                    const SizedBox(height: 20),
                                    YoutubePlayer(
                                      width: 230,
                                      controller: _controller,
                                      liveUIColor: Colors.amber,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                ],
              ),
              Container(
                height: 100,
                child: Column(
                  children: [
                    Text('Geofencing'),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Add region"),
                              onPressed: () {
                                // addRegion();
                                Geolocation location = Geolocation(
                                    latitude: 12.92516674641180,
                                    longitude: 80.23158749732800,
                                    radius: 50.0,
                                    id: "Kerkplein13");
                                Geofence.addGeolocation(location, GeolocationEvent.entry)
                                    .then((onValue) {
                                  print("great success");
                                  scheduleNotification(
                                      "Georegion added", "Your geofence has been added!");
                                }).catchError((onError) {
                                  print("great failure");
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Add neighbour region"),
                              onPressed: () {
                                Geolocation location = const Geolocation(
                                    latitude: 12.92516674641180,
                                    longitude: 80.23158749732800,
                                    radius: 50.0,
                                    id: "chennai");
                                Geofence.addGeolocation(location, GeolocationEvent.entry)
                                    .then((onValue) {
                                  print("great success");
                                  scheduleNotification(
                                      "Georegion added", "Your geofence has been added!");
                                }).catchError((onError) {
                                  print("great failure");
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Remove regions"),
                              onPressed: () {
                                print('Removed Regions');
                                Geofence.removeAllGeolocations();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Request Permissions"),
                              onPressed: () {
                                print('pressed');
                                Geofence.requestPermissions();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                child: Text("get user location"),
                                onPressed: () {
                                  Geofence.getCurrentLocation().then((coordinate) {
                                    print('cur loccation: $coordinate');
                                    print(
                                        "great got latitude: ${coordinate?.latitude} and longitude: ${coordinate?.longitude}");
                                  });
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                child: Text("Listen to background updates"),
                                onPressed: () {
                                  Geofence.startListeningForLocationChanges();
                                  Geofence.backgroundLocationUpdated.stream.listen((event) {
                                    scheduleNotification("You moved significantly",
                                        "a significant location change just happened.");
                                  });
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                child: Text("Stop listening to background updates"),
                                onPressed: () {
                                  Geofence.stopListeningForLocationChanges();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }


void scheduleNotification(String title, String subtitle) {
  print("scheduling one with $title and $subtitle");
  var rng = Random();
  Future.delayed(Duration(seconds: 5)).then((result) async {
    var androidPlatformChannelSpecifics =const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription:  'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        rng.nextInt(100000), title, subtitle, platformChannelSpecifics,
        payload: 'item x');
  });
}
}