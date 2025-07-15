import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String term;
  final String definition;
  final String example;
  final String author;
  final String writtenOn;

  const WordCard(
      {super.key,
      this.term = 'The Word',
      this.definition = 'The definition of the word',
      this.example = 'Example',
      this.author = 'just_a_username',
      this.writtenOn = 'Month 1, 2000'});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const spacer = SizedBox(height: 10);
    return Card(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  term,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_outline),
                )
              ],
            ),
            // Line
            Container(
              color: theme.textTheme.headlineLarge?.color,
              height: 2,
            ),
            spacer,
            // Body
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Meaning
                Text(definition, style: theme.textTheme.bodyLarge),
                spacer,
                // Example
                Column(
                  children: [
                    Text(
                      example,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                spacer,
                // Credit
                Text('by $author on $writtenOn',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w300))
              ],
            )
          ],
        ),
      ),
    );
  }
}
