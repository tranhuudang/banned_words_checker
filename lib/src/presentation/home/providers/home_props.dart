class HomeProps {
  final List<String> wordList;
  final List<String> reportedWordList;
  final List<String> foundWords;
  final int numberOfVisitor;
  final bool isLoading;
  final bool isReportedListLoading;
  final bool isNumberOfVisitorLoading;
  final bool isReported;

  HomeProps({
    this.wordList = const [],
    this.reportedWordList = const [],
    this.foundWords = const [],
    this.numberOfVisitor = 0,
    this.isLoading = true,
    this.isReportedListLoading = true,
    this.isNumberOfVisitorLoading = true,
    this.isReported = false,
  });

  HomeProps copyWith({
    List<String>? wordList,
    List<String>? reportedWordList,
    List<String>? foundWords,
    int? numberOfVisitor,
    bool? isLoading,
    bool? isReportedListLoading,
    bool? isNumberOfVisitorLoading,
    bool? isReported,
  }) {
    return HomeProps(
      wordList: wordList ?? this.wordList,
      reportedWordList: reportedWordList ?? this.reportedWordList,
      foundWords: foundWords ?? this.foundWords,
      numberOfVisitor: numberOfVisitor ?? this.numberOfVisitor,
      isLoading: isLoading ?? this.isLoading,
      isReportedListLoading:
      isReportedListLoading ?? this.isReportedListLoading,
      isNumberOfVisitorLoading:
      isNumberOfVisitorLoading ?? this.isNumberOfVisitorLoading,
      isReported: isReported ?? this.isReported,
    );
  }
}