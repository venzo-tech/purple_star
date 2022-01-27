import 'package:flutter/material.dart';
import 'package:purple_star/screens/Drawer%20Menu/Help/help_detail_page.dart';
import 'package:purple_star/screens/Model/help_model.dart';
import 'package:purple_star/screens/Services/help_service.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/back_button.dart';

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
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Back Button
            const CustomBackButton(),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
