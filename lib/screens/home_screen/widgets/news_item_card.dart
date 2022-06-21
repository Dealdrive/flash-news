import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class NewsItemCard extends StatelessWidget {
  const NewsItemCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.source.name ?? "",
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              Image.network(
                article.imageUrl ?? "",
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                frameBuilder: (context, child, frame, _) {
                  if (frame == null) {
                    return Container(
                      color: Colors.grey.shade300,
                      width: 120,
                      height: 120,
                    );
                  } else {
                    return child;
                  }
                },
                errorBuilder: (context, object, error) {
                  return SizedBox.shrink();
                },
              )
            ],
          )),
    );
  }
}
