import 'package:dwallet/pages/verify_mnemonic.dart';
import 'package:dwallet/providers/walletprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWords = mnemonic.split(' ');

    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mnemonic Copied to Clipboard')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyMnemonicPage(mnemonic: mnemonic),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Mnemonic'),
        backgroundColor: Colors.teal[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please store this mnemonic phrase safely:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),

            // Grid for mnemonic words without index numbers
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mnemonicWords.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjust as needed for layout
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.teal[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mnemonicWords[index],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24.0),

            // Copy button with enhanced styling
            ElevatedButton.icon(
              onPressed: copyToClipboard,
              icon: const Icon(Icons.copy),
              label: const Text('Copy to Clipboard'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                textStyle: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
