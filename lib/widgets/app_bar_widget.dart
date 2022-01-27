// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:purple_star/widgets/search_purplestar.dart';
//
// class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
//   const AppBarWidget({Key? key}) : super(key: key);
//
//   @override
//   _AppBarWidgetState createState() => _AppBarWidgetState();
//
//   @override
//   Size get preferredSize => const Size.fromHeight(60);
// }
//
// class _AppBarWidgetState extends State<AppBarWidget> {
//
//   late FloatingSearchBarController controller;
//
//   static const historyLength = 5;
//
// // The "raw" history that we don't access from the UI, prefilled with values
//   List<String> _searchHistory = [
//     'fuchsia',
//     'flutter',
//     'widgets',
//     'resocoder',
//   ];
// // The filtered & ordered history that's accessed from the UI
//   late List<String> filteredSearchHistory;
//
// // The currently searched-for term
//   late String selectedTerm = "";
//
//   List<String> filterSearchTerms({
//     required String filter,
//   }) {
//     if (filter != null && filter.isNotEmpty) {
//       // Reversed because we want the last added items to appear first in the UI
//       return _searchHistory.reversed
//           .where((term) => term.startsWith(filter))
//           .toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }
//
//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       // This method will be implemented soon
//       putSearchTermFirst(term);
//       return;
//     }
//     _searchHistory.add(term);
//     if (_searchHistory.length > historyLength) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLength);
//     }
//     // Changes in _searchHistory mean that we have to update the filteredSearchHistory
//     filteredSearchHistory = filterSearchTerms(filter: "null");
//   }
//
//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((t) => t == term);
//     filteredSearchHistory = filterSearchTerms(filter: "null");
//   }
//
//   void putSearchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     controller = FloatingSearchBarController();
//     filteredSearchHistory = filterSearchTerms(filter: "");
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingSearchBar(
//       controller: controller,
//       body: FloatingSearchBarScrollNotifier(
//         child: SearchResultsListView(
//           searchTerm: selectedTerm,
//         ),
//       ),
//       transition: CircularFloatingSearchBarTransition(),
//       physics: BouncingScrollPhysics(),
//       title: Text(
//         selectedTerm ?? 'The Search App',
//         style: Theme.of(context).textTheme.headline6,
//       ),
//       hint: 'Search and find out...',
//       actions: [
//         FloatingSearchBarAction.searchToClear(),
//       ],
//       onQueryChanged: (query) {
//         setState(() {
//           filteredSearchHistory = filterSearchTerms(filter: query);
//         });
//       },
//       onSubmitted: (query) {
//         setState(() {
//           addSearchTerm(query);
//           selectedTerm = query;
//         });
//         controller.close();
//       },
//       builder: (context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Material(
//             color: Colors.white,
//             elevation: 4,
//             child: Builder(
//               builder: (context) {
//                 if (filteredSearchHistory.isEmpty &&
//                     controller.query.isEmpty) {
//                   return Container(
//                     height: 56,
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Start searching',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   );
//                 } else if (filteredSearchHistory.isEmpty) {
//                   return ListTile(
//                     title: Text(controller.query),
//                     leading: const Icon(Icons.search),
//                     onTap: () {
//                       setState(() {
//                         addSearchTerm(controller.query);
//                         selectedTerm = controller.query;
//                       });
//                       controller.close();
//                     },
//                   );
//                 } else {
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: filteredSearchHistory
//                         .map(
//                           (term) => ListTile(
//                         title: Text(
//                           term,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         leading: const Icon(Icons.history),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.clear),
//                           onPressed: () {
//                             setState(() {
//                               deleteSearchTerm(term);
//                             });
//                           },
//                         ),
//                         onTap: () {
//                           setState(() {
//                             putSearchTermFirst(term);
//                             selectedTerm = term;
//                           });
//                           controller.close();
//                         },
//                       ),
//                     )
//                         .toList(),
//                   );
//                 }
//               },
//             ),
//           ),
//         );
//       },
//     );
//
//     return FloatingSearchBar(
//       controller: controller,
//       body: FloatingSearchBarScrollNotifier(
//         child: SearchResultsListView(
//           searchTerm: selectedTerm,
//         ),
//       ),
//       transition: CircularFloatingSearchBarTransition(),
//       physics: BouncingScrollPhysics(),
//       title: Text(
//         selectedTerm ?? 'The Search App',
//       ),
//       hint: 'Search and find out...',
//       actions: [
//         FloatingSearchBarAction.searchToClear(),
//       ],
//       onQueryChanged: (query) {
//         setState(() {
//           filteredSearchHistory = filterSearchTerms(filter: query);
//         });
//       },
//       onSubmitted: (query) {
//         setState(() {
//           addSearchTerm(query);
//           selectedTerm = query;
//         });
//         controller.close();
//       },
//       builder: ( context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child:const Material(
//             color: Colors.white,
//             elevation: 4,
//             child: Placeholder(
//               fallbackHeight: 200,
//             ),
//           ),
//         );
//       },
//
//     );
//   }
// }
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/search_purplestar.dart';
import 'package:purple_star/screens/search_purplestar.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(55);

  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child:  CupertinoSearchTextField(
          onTap: (){
            Get.to(() =>const SearchPurpleStar());
          },
          padding: EdgeInsetsDirectional.fromSTEB(10, 8, 5, 8),
            prefixInsets: EdgeInsetsDirectional.only(start: 20),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          backgroundColor: Colors.white,
          placeholder: 'Search Purple Star'
        ),
      ),

      // InkWell(
      //   onTap: () async{
      //     // showSearch(context: context, delegate: SearchPurpleStar());
      //   },
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(20.0),
      //       color: Colors.white,
      //     ),
      //     width: MediaQuery.of(context).size.width * 0.8,
      //     height: 30,
      //     child: Align(
      //       alignment: Alignment.centerLeft,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: const <Widget>[
      //           Padding(
      //             padding:  EdgeInsets.fromLTRB(30, 0, 10, 0),
      //             child:  Text('Search Purple Star',
      //               style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xffa3a3a3)),
      //               ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(right: 20),
      //             child: Icon(Icons.search_sharp, color: Color(0xffa3a3a3),),
      //           )
      //         ],
      //       ),
      //     ),
      //     ),
      // ),
    );
  }
}