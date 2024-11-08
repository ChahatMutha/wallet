import 'package:dwallet/pages/signuppage.dart';
import 'package:dwallet/widgets/onboardincard.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // Moved `_onboardingpages` inside the `build` method to access `context`.
    List<Widget> _onboardingpages = [
      OnboardingCard(
        image: "assets/images/welcome.png",
        title: "Welcome to Digital Wallet",
        description:
            "Introducing the seamless transaction platform and providing an overview of the application purpose",
        buttonText: "Next",
        onpressed: () {
          _pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
      ),
      OnboardingCard(
        image: "assets/images/onboard2.jpg",
        title: "Create an account and choose a Wallet",
        description:
            "Directing users to create an account and select a wallet that fits their interests and needs",
        buttonText: "Next",
        onpressed: () {
          _pageController.animateToPage(2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
      ),
      OnboardingCard(
        image: "assets/images/onboard3.jpg",
        title: "Seamless Transaction",
        description:
            "Emphasizing the benefits of exchanging transactions seamlessly that can be tailored to user's personal needs",
        buttonText: "Done",
        onpressed: () {
          // Using `context` here to navigate to the `SignUp` page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        },
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onboardingpages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingpages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ],
        ),
      ),
    );
  }
}
