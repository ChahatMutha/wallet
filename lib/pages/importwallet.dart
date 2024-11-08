import 'package:dwallet/pages/wallet.dart';
import 'package:dwallet/providers/walletprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  _ImportWalletState createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  bool isVerified = false;
  String verificationText = '';

  void navigateToWalletPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void verifyMnemonic() async {
      final walletProvider =
          Provider.of<WalletProvider>(context, listen: false);

      // Call the getPrivateKey function from the WalletProvider
      final privateKey = await walletProvider.getPrivateKey(verificationText);

      // Navigate to the WalletPage
      navigateToWalletPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Import from Seed'),
        backgroundColor:
            Colors.blueAccent, // Set your desired background color here
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Help',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Mnemonic Phrase'),
                  content: const Text(
                    'Enter your 12 or 24-word mnemonic phrase here to import your wallet.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please Enter your mnemonic phrase:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter mnemonic phrase',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: verifyMnemonic,
              child: const Text('Import'),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
