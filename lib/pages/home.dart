import 'package:dwallet/pages/login_page.dart';
import 'package:dwallet/providers/walletprovider.dart';
import 'package:dwallet/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the WalletProvider and load the private key
    WalletProvider walletProvider = WalletProvider();
    walletProvider.loadPrivateKey();

    return ChangeNotifierProvider<WalletProvider>.value(
      value: walletProvider,
      child: MaterialApp(
        initialRoute: MyRoutes.loginRoute,
        routes: {
          MyRoutes.loginRoute: (context) => const LoginPage(),
        },
      ),
    );
  }
}
