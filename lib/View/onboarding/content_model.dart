
class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Welcome to BPro App Wallet',
    image: 'assets/images/wallet.png',
    discription: "The premier app designed for those who love gaming and winning big! Experience the thrill of playing a wide array of games and seize your chance to win millions."
  ),
  UnbordingContent(
    title: 'Explore the Best Games',
    image: 'assets/images/game.png',
    discription: "Cricket, Hockey, Horse Riding, Volleyball, Dog Race, and More to win"
  ),
  UnbordingContent(
    title: 'Explore the Best Online Sports and Games',
    image: 'assets/images/sports.png',
    discription: "Bet Pro Wallet allows you to dive into thousands of online games, including cricket, hockey, horse riding, volleyball, and dog racing. Play and earn millions with the ultimate gaming experience"
  ),
];
