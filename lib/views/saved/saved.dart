import 'package:flutter/material.dart';
import 'package:slangary/widgets/word_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _buildBody(context, theme);
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 12 / 100,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 83 / 100,
            child: ListView(
              children: const [WordCard()],
            ),
          )
        ],
      ),
    );
  }
}
