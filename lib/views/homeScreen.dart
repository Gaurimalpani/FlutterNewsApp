import 'package:flutter/material.dart';
import 'package:flutterproj/views/widgets/news_card.dart';
import 'package:flutterproj/models/news.dart';
import 'package:flutterproj/models/newapi.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterproj/views/crudScreen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late List<Article> _articles;
  bool _isLoading = true;

  String formattedDate(DateTime publishedAt) {
    final DateFormat formatter = DateFormat('dd MMM yy, HH:mm');
    return formatter.format(publishedAt);
  }

  @override
  void initState() {
    super.initState();
    getmyarticles();
  }

  Future<void> getmyarticles() async {
    _articles = await fetchArticles();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(_articles[index].url))) {
                        throw Exception(
                            'Could not launch $_articles[index].url');
                      }
                    },
                    child: NewsCard(
                        title: _articles[index].title,
                        publishedDate:
                            formattedDate(_articles[index].publishedAt),
                        thumbnailUrl: _articles[index].urlToImage),
                  );
                },
              ));
  }
}
