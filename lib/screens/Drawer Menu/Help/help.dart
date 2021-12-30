import 'package:flutter/material.dart';
import 'package:purple_star/screens/Drawer%20Menu/Help/help_detail_page.dart';
import 'package:purple_star/screens/Model/help_model.dart';
import 'package:purple_star/screens/Services/help_service.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  late Future<List<HelpModel>> futureHelp;

  @override
  void initState() {
    super.initState();
    futureHelp = fetchHelp();
    print(futureHelp);
    // print(futureProduct.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 30,
          child: const TextField(
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              hintText: 'Search Purple Star',
              suffixIcon: Icon(Icons.search_sharp),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Back Button Start
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 15, 15, 15),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.chevron_left, color: Color(0xff2d2d2d)), // icon
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Color(0xff2d2d2d)),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                'Help',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
              ),
            ),
            const Divider(
              endIndent: 40,
              height: 1,
              color: Color(0xffa3a3a3),
            ),
//Back Button End,
            FutureBuilder<List<HelpModel>>(
              future: futureHelp,
              builder: (context, snapshot) {
                // print(snapshot);
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HelpDetailPage(
                                          question:
                                              snapshot.data![index].question,
                                          answer: snapshot.data![index].answer,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data![index].question,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Icon(Icons.chevron_right, color: Color(0xff2d2d2d), size: 20,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: Color(0xffa3a3a3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
