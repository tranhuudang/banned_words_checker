List<String> removeDuplicates(List<String> list) {
  // Convert the list to a set to remove duplicates
  Set<String> uniqueSet = list.toSet();

  // Convert the set back to a list
  List<String> uniqueList = uniqueSet.toList();

  return uniqueList;
}