import 'package:dwallet/pages/createorimport.dart';
import 'package:dwallet/pages/wallet.dart';
import 'package:dwallet/providers/walletprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      // If private key doesn't exist, load CreateOrImportPage
      return const CreateOrImportPage();
    } else {
      // If private key exists, load WalletPage
      return WalletPage();
    }
  }
}
