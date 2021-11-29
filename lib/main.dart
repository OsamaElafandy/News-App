import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:newsapp/widget/customListTile.dart';
import 'model/article_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black38),
        title: "NEWS APP",
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text("News App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () => client.getArticle(),
        child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              var articles = snapshot.data;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    CustomListTile(article: articles[index]),
              );
            }
            return const Center(
              child: AwesomeLoader(
                loaderType: AwesomeLoader.AwesomeLoader4,
                color: Colors.black87,
              ),
            );
          },
        ),
      ),
    );
  }
}
