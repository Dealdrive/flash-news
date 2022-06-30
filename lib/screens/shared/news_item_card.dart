import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/pair.dart';
import 'package:news_app/screens/webview_screen/webview_screen.dart';
import 'package:news_app/utils/format_time.dart';

class NewsItemCard extends StatelessWidget {
  const NewsItemCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          WebViewScreen.routeName,
          arguments: Pair(article.title, article.url),
        );
      },
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: 120,
        child: Card(
            elevation: 2.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          article.title ?? "",
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              formatToRelativeTime(article.timePublished),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const SizedBox(
                              height: 12,
                              child: VerticalDivider(
                                thickness: 1,
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 1),
                                    child: Text(
                                      article.source.name ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                article.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: article.imageUrl!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                        placeholder: (context, url) {
                          return Container(
                            color: Colors.grey.shade300,
                            width: 120,
                            height: 120,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const SizedBox.shrink();
                        },
                      )
                    : const SizedBox.shrink()
              ],
            )),
      ),
    );
  }
}
