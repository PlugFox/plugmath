part of plugmath;

typedef Comparator<T> = int Function(T a, T b);

int binarySearch<T>(List<T> sortedList, T value, {Comparator<T> comparator, bool needToSort = false}) {
  if (needToSort) {
    sortedList.sort();
  }
  comparator ??= _defaultComparator;
  int min = 0;
  int max = sortedList.length;
  while (min < max) {
    int mid = min + ((max - min) >> 1);
    var element = sortedList[mid];
    int comp = comparator(element, value);
    if (comp == 0) return mid;
    if (comp < 0) {
      min = mid + 1;
    } else {
      max = mid;
    }
  }
  return -1;
}

int _defaultComparator<T>(T a, T b) {
  if (a is Comparable && b is Comparable) {
    return a.compareTo(b);
  } else {
    throw UnsupportedError('Unsupported type in compare function: ${T.toString()}');
  }
}