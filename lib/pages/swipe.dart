// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_tindercard/flutter_tindercard.dart';
// import 'package:herodb/constants.dart';
// import 'package:herodb/pages/details_page.dart';
// import 'package:herodb/widgets/back_card/back_card.dart';
// import '../api.dart';
// import '../widgets/front_card/front_card.dart';

// class SwipeScreen extends StatefulWidget {
//   const SwipeScreen({Key? key}) : super(key: key);

//   @override
//   State<SwipeScreen> createState() => _SwipeScreenState();
// }

// class _SwipeScreenState extends State<SwipeScreen> {
//   //PageController pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     // ignore: unused_local_variable
//     CardController controller;
//     return FutureBuilder<dynamic>(
//       future: getHeroes(),
//       builder: ((context, snapshot) {
//         if (snapshot.hasData) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: TinderSwapCard(
//                     swipeUp: false,
//                     swipeDown: false,
//                     orientation: AmassOrientation.TOP,
//                     totalNum: snapshot.data.length,
//                     stackNum: 5,
//                     swipeEdge: 4.0,
//                     maxWidth: MediaQuery.of(context).size.width,
//                     maxHeight: MediaQuery.of(context).size.height,
//                     minWidth: MediaQuery.of(context).size.width * 0.8,
//                     minHeight: MediaQuery.of(context).size.height * 0.8,
//                     cardBuilder: (context, index) {
//                       var heroes = snapshot.data![index];

//                       //condintions to custom colors and images

//                       String publisherName =
//                           heroes['biography']['publisher'].toString();
//                       String placeOfBirth =
//                           heroes['biography']['placeOfBirth'].toString();
//                       String race = heroes['appearance']['race'].toString();
//                       String name = heroes['name'].toString();
//                       String fullName =
//                           heroes['biography']['fullName'].toString();
//                       String img = heroes['images']['md'].toString();
//                       String powerStats =
//                           heroes['powerstats']['intelligence'].toString();
//                       String powerStats2 =
//                           heroes['powerstats']['strength'].toString();
//                       String powerStats3 =
//                           heroes['powerstats']['speed'].toString();
//                       String powerStats4 =
//                           heroes['powerstats']['durability'].toString();
//                       String powerStats5 =
//                           heroes['powerstats']['power'].toString();
//                       String powerStats6 =
//                           heroes['powerstats']['combat'].toString();

//                       if (publisherName == 'Marvel Comics' ||
//                           publisherName == 'She-Thing' ||
//                           publisherName == 'Rune King Thor' ||
//                           publisherName == 'Ms Marvel II' ||
//                           publisherName == 'Jean Grey' ||
//                           publisherName == 'Archangel' ||
//                           publisherName == 'Tempest' ||
//                           publisherName == 'Angel Salvadore' ||
//                           publisherName == 'Giant-Man' ||
//                           publisherName == 'Ant-Man' ||
//                           publisherName == 'Venom III' ||
//                           publisherName == 'Thunderbird II' ||
//                           publisherName == 'Anti-Venom' ||
//                           publisherName == 'Anti-Vision' ||
//                           publisherName == 'Toxin' ||
//                           publisherName == 'Angel' ||
//                           publisherName == 'Goliath' ||
//                           publisherName == 'Binary' ||
//                           publisherName == 'Evil Deadpool' ||
//                           publisherName == 'Deadpool' ||
//                           publisherName == 'Scorpion' ||
//                           publisherName == 'Vindicator II' ||
//                           publisherName == 'Icon Comics' ||
//                           publisherName == 'Spider-Carnage' ||
//                           publisherName == 'Flash IV' ||
//                           publisherName == 'Power Woman' ||
//                           publisherName == 'Power Man' ||
//                           publisherName == 'Iron Lad' ||
//                           publisherName == 'Phoenix') {
//                         publisherName = 'Marvel Comics';
//                       } else if (publisherName == 'DC Comics' ||
//                           publisherName == 'Wildstorm' ||
//                           publisherName == 'Aztar' ||
//                           publisherName == 'Oracle' ||
//                           publisherName == 'Spoiler' ||
//                           publisherName == 'Nightwing' ||
//                           publisherName == 'Gemini V' ||
//                           publisherName == 'Batgirl V' ||
//                           publisherName == 'Batgirl' ||
//                           publisherName == 'Batman II' ||
//                           publisherName == 'Robin II' ||
//                           publisherName == 'Red Hood' ||
//                           publisherName == 'Red Robin' ||
//                           publisherName == 'Robin III' ||
//                           publisherName == 'Black Racer' ||
//                           publisherName == 'Speed Demon' ||
//                           publisherName == 'Impulse' ||
//                           publisherName == 'Superman Prime One-Million' ||
//                           publisherName == 'Batgirl III') {
//                         publisherName = 'DC Comics';
//                       }
//                       return Center(
//                         child: FlipCard(
//                           front: FrontCard(
//                             name: name,
//                             placeOfBirth:
//                                 placeOfBirth == '-' || placeOfBirth == 'null'
//                                     ? placeOfBirthError
//                                     : placeOfBirth,
//                             race: race == 'null' ? raceError : race,
//                             realname: fullName == '' ? name : fullName,
//                             image: img,
//                             brand: publisherName,
//                             publisher: publisherName,
//                           ),
//                           back: BackCard(
//                             powerStats: powerStats,
//                             powerStats2: powerStats2,
//                             powerStats3: powerStats3,
//                             powerStats4: powerStats4,
//                             powerStats5: powerStats5,
//                             powerStats6: powerStats6,
//                             onTab: () {
//                               Future.delayed(const Duration(milliseconds: 400), () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => HeroesDetailsScreen(hero: heroes,)));
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     cardController: controller = CardController(),
//                     swipeUpdateCallback:
//                         (DragUpdateDetails details, Alignment align) {
//                       /// Get swiping card's alignment
//                       if (align.x < 0) {
//                         //Card is LEFT swiping
//                       } else if (align.x > 0) {
//                         //Card is RIGHT swiping
//                       }
//                     },
//                     swipeCompleteCallback:
//                         (CardSwipeOrientation orientation, int index) {
//                       /// Get orientation & index of swiped card!
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('${snapshot.error}'));
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }),
//     );
//   }
// }