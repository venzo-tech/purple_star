import 'package:flutter/material.dart';
import 'package:purple_star/screens/Drawer%20Menu/Blog/blog_detail_page.dart';
import 'package:purple_star/screens/Model/blog_model.dart';
import 'package:purple_star/screens/Services/blog_service.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  late Future<List<BlogPost>> futureBlog;

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlog();
    print(futureBlog);
    // print(futureProduct.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const [
                    Icon(Icons.chevron_left,color: Color(0xff2d2d2d)), // icon
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
              child: Text('Blog', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),),
            ),
            const Divider(
              endIndent: 40, height: 1,
              color: Color(0xffa3a3a3),
            ),
//Back Button End,
            FutureBuilder<List<BlogPost>>(
              future: futureBlog,
              builder: (context, snapshot) {
                // print(snapshot);
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                padding: const EdgeInsets.all(5.0),
                                child: Column(

                                          children: [
                                            InkWell(
                                              onTap:() =>
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => BlogDetailPage(title:snapshot.data![index].title, desc: snapshot.data![index].body,),
                                                  ),
                                                ),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data![index].title,
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins Bold',
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20,),
                                                  Text(
                                                    snapshot.data![index].body,
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                          ],
                                        )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
