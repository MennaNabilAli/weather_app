import 'package:flutter/material.dart';
import 'screen/layout.dart';
import 'shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white70)
          ),
      ),

      themeMode: ThemeMode.light,
      home: Layout(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Localizations(
//       locale: const Locale('en', 'US'),
//       delegates: const <LocalizationsDelegate<dynamic>>[
//         DefaultWidgetsLocalizations.delegate,
//         DefaultMaterialLocalizations.delegate,
//       ],
//       child: MaterialApp(
//         title: 'My App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Bottom Sheet Example'),
//           ),
//           body: Center(
//             child: ElevatedButton(
//               onPressed: () => openBottomSheet(context),
//               child: Text('Open Bottom Sheet'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Item {
//   final String title;
//   final String description;
//   final int id;
//
//   Item({required this.title, required this.description, required this.id});
// }
//
// List<Item> mainData = [
//   Item(title: 'Question 1', description: 'Description for question 1', id: 1),
//   Item(title: 'Question 2', description: 'Description for question 2', id: 2),
//   // Add more items as needed
// ];
//
// void openBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return ListView.builder(
//         itemCount: mainData.length, // Assuming mainData is your list of items
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(mainData[index].title), // Assuming each item has a title
//             onTap: () {
//               Navigator.of(context).pop(); // Close the bottom sheet
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => DetailPage(item: mainData[index]),
//                 ),
//               );
//             },
//           );
//         },
//       );
//     },
//   );
// }
//
// class DetailPage extends StatelessWidget {
//   final Item item; // Assuming Item is the type of your data items
//
//   DetailPage({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item.title), // Display the item's title in the app bar
//       ),
//       body: Center(
//         child: Text('Detail Page for ${item.title}'),
//       ),
//     );
//   }
// }