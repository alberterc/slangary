import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleCard extends StatelessWidget {
  final String title;

  const TitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 9 / 100,
          decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                key: const Key('search_page_button'),
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.search_outlined),
              ),
              Text(
                title,
                style: theme.textTheme.headlineLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_outline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
