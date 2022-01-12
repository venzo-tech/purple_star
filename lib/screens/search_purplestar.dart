import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/Services/product_services.dart';
import 'package:purple_star/screens/product_detail_page.dart';
import 'package:purple_star/widgets/back_button.dart';

class SearchPurpleStar extends StatefulWidget {
  const SearchPurpleStar({Key? key}) : super(key: key);

  @override
  _SearchPurpleStarState createState() => _SearchPurpleStarState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _SearchPurpleStarState extends State<SearchPurpleStar> {

  final _debouncer = Debouncer();

  List<Product> ulist = [];
  List<Product> userLists = [];

  // List<Product>? productSearch;
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchProduct().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:  CupertinoSearchTextField(
            controller: _textEditingController,
            focusNode: _textFocusNode,
            autofocus: true,
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.strains.toLowerCase().contains(
                        string.toLowerCase(),
                      )),
                    )
                        .toList();
                  });
                  // print('list: ${userLists.length}');
                });
              },
              padding: EdgeInsetsDirectional.fromSTEB(10, 8, 5, 8),
              prefixInsets: EdgeInsetsDirectional.only(start: 20),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              backgroundColor: Colors.white,
              placeholder: 'Search Purple Star'
          ),
        ),
      ),
      body: _textEditingController!.text.isNotEmpty &&
          userLists.length == 0
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: const <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_off,
                  size: 160,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No results found,\nPlease try different keyword',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      )
          :  SingleChildScrollView(
        child: Column(
          children: [
          const CustomBackButton(),
           ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  itemCount: _textEditingController!.text.isNotEmpty
                      ? userLists.length
                      : ulist.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print('ss ${userLists.length}');
                    return userLists.isEmpty ? const Center(child: Text('No Search found'),) : InkWell(
                      onTap: (){
                      Get.to(() =>ProductDetailPage(
                        product: userLists[index],
                      ),);
                    },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  userLists[index].title,
                                  style: TextStyle(fontSize: 16),
                                ),
                                subtitle: Text(
                                  userLists[index].strains,
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
          ],
        ),
      ),
    );
  }
}
