import 'package:banned_words_checker/src/core/extentions/language_extension.dart';
import 'package:banned_words_checker/src/core/extentions/number_extenstion.dart';
import 'package:banned_words_checker/src/presentation/home/components/footer.dart';
import 'package:banned_words_checker/src/presentation/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:wave_divider/wave_divider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordListState = ref.watch(homePropsProvider);
    final wordListNotifier = ref.read(homePropsProvider.notifier);
    final TextEditingController controller = TextEditingController();
    final TextEditingController newWordController = TextEditingController();

    final time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/icon.png',
              height: 35,
              width: 35,
            ),
            8.width,
            Text('Banned Words Checker'.i18n),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Visitors: ${wordListState.numberOfVisitor}'),
              Wrap(
                spacing: 32,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${'Language'.i18n}: '),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: I18n.of(context).locale.languageCode,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              I18n.of(context).locale = newValue.toLocale();
                            }
                          },
                          items: <String>['en', 'vi']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value.i18n),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${'Platform'.i18n}: '),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: 'Tiktok',
                          onChanged: (String? newValue) {},
                          items: <String>['Tiktok']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.height,
              Text(
                'Check if your paragraph contains any banned words from TikTok that could potentially reduce your viewership.'
                    .i18n,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.height,
              if (wordListState.wordList.isNotEmpty)
                Text(
                  '${'Total words in the banned list'.i18n}: ${wordListState.wordList.length} (${time.day}-${time.month}-${time.year})',
                ),
              16.height,
              if (wordListState.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            'Enter the paragraph you want to check here'.i18n,
                      ),
                    ),
                    16.height,
                    FilledButton(
                      onPressed: () {
                        wordListNotifier
                            .checkWords(controller.text.toLowerCase().trim());
                      },
                      child: Text('Check Words'.i18n),
                    ),
                  ],
                ),
              const SizedBox(height: 16.0),
              if (wordListState.foundWords.isNotEmpty) ...[
                Text(
                  '${'Found words that could potentially be banned from TikTok'.i18n}: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: wordListState.foundWords
                      .map((word) => Chip(label: Text(word)))
                      .toList(),
                ),
              ],
              const Divider(),
              Text(
                'Help us improve the app by reporting new words'.i18n,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.height,
              TextField(
                controller: newWordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a new word to add'.i18n,
                ),
                onSubmitted: (String value) {
                  wordListNotifier.addNewWord(value, controller.text);
                  newWordController.clear();
                },
              ),
              16.height,
              if (wordListState.isReported) ...[
                Text(
                  'We appreciate your contribution and commitment to making our platform better.'
                      .i18n,
                ),
                16.height,
              ],
              FilledButton(
                onPressed: () {
                  wordListNotifier.addNewWord(
                      newWordController.text, controller.text);
                  newWordController.clear();
                },
                child: Text('Report word'.i18n),
              ),
              16.height,
              const WaveDivider(),
              16.height,
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
