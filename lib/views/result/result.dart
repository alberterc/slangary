import 'package:flutter/material.dart';
import 'package:slangary/services/urban_dict_service.dart';
import 'package:slangary/utils/time.dart';
import 'package:slangary/widgets/word_card.dart';

class ResultPage extends StatefulWidget {
  final String term;
  final bool random;

  const ResultPage({super.key, required this.term, required this.random});

  @override
  State<StatefulWidget> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
            child: FutureBuilder(
                future: widget.random
                    ? UrbanDictService().random()
                    : UrbanDictService().defineTerm(widget.term),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: theme.textTheme.bodyLarge,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final termResultList = snapshot.data!.list;
                      if (termResultList.isEmpty) {
                        return Center(
                          child: Text(
                            'There is no result for ${widget.term}.',
                            style: theme.textTheme.bodyLarge,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: termResultList.length,
                            itemBuilder: (context, index) {
                              return WordCard(
                                term: termResultList[index].word,
                                definition: termResultList[index].definition,
                                example: termResultList[index].example,
                                author: termResultList[index].author,
                                writtenOn: Time(
                                        dateTime:
                                            termResultList[index].writtenOn)
                                    .formatToDateWithMonthName(),
                              );
                            });
                      }
                    }
                  }
                  return const SizedBox.shrink();
                }),
          )
        ],
      ),
    );
  }
}
