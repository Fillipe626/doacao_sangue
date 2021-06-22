import 'package:doacao_sangue/screens/home_screen.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/donation_model.dart';
import 'models/user_model.dart';


void main() {


  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("13adc815-77ad-4899-94a4-02a818bc9aa9");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    return ScopedModel<UserModel>(
        model: UserModel(),//Para evitar o setState por todo o app
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return ScopedModel<DonationModel>(
              model: DonationModel(model),
              child: MaterialApp(
                title: 'Doação de Sangue',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Color.fromARGB(255, 4, 125, 200)

                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              ),
            );
          },
    )

    );

  }

}

