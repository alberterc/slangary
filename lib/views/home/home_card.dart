import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slangary/services/urban_dict_service.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late final TextEditingController _termSearchController;
  late final FocusNode _termSearchFocusNode;

  @override
  void initState() {
    super.initState();
    _termSearchController = TextEditingController();
    _termSearchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _termSearchController.dispose();
    _termSearchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primaryContainer,
      elevation: 0.0,
      borderOnForeground: false,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      child: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 64 / 100,
          child: Column(
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final resp = await UrbanDictService().test();
                      print(resp);
                    },
                    icon: const Icon(Icons.history_outlined),
                  ),
                  Text(
                    'Slangary',
                    style: theme.textTheme.headlineLarge,
                  ),
                  IconButton(
                      onPressed: () => context.push('/saved'),
                      icon: const Icon(Icons.bookmark_outline))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Subtitle
                    Text(
                      'What word are you looking for?',
                      style: theme.textTheme.headlineMedium,
                    ),
                    // Text Field
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(30, 30, 30, 0.25),
                            ),
                            BoxShadow(
                                color: Color.fromRGBO(228, 228, 228, 1),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                spreadRadius: -1),
                          ]),
                      child: TextField(
                        controller: _termSearchController,
                        focusNode: _termSearchFocusNode,
                        autocorrect: false,
                        autofocus: false,
                        onEditingComplete: () =>
                            _searchTerm(context, _termSearchController.text),
                        onTapOutside: (_) => _termSearchFocusNode.unfocus(),
                        decoration: const InputDecoration(
                          hintText: 'Enter a word',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                          ),
                        ),
                      ),
                    ),
                    // Text Field Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          key: const Key('random_button'),
                          onPressed: () => _randomTerm(context),
                          child: const Text('Random'),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        FilledButton(
                          key: const Key('search_button'),
                          onPressed: () =>
                              _searchTerm(context, _termSearchController.text),
                          child: const Text(
                            'Search',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void _searchTerm(BuildContext context, String term) {
    if (term.isNotEmpty) {
      context.push('/result?term=$term&random=false');
      _termSearchController.clear();
      _termSearchFocusNode.unfocus();
    }
  }

  void _randomTerm(BuildContext context) {
    context.push('/result?term=&random=true');
    _termSearchController.clear();
    _termSearchFocusNode.unfocus();
  }
}
