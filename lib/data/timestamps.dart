// ignore_for_file: prefer_const_constructors

class VerseTimestamp {
  final Duration start;
  final Duration end;

  VerseTimestamp({required this.start, required this.end});
}

final Map<int, VerseTimestamp> verseTimestamps = {
  1: VerseTimestamp(
    start: const Duration(seconds: 14),
    end: const Duration(seconds: 22),
  ),
  2: VerseTimestamp(
    start: Duration(seconds: 23),
    end: Duration(seconds: 34),
  ),
  3: VerseTimestamp(
    start: Duration(seconds: 35),
    end: Duration(seconds: 48),
  ),
  4: VerseTimestamp(
    start: Duration(seconds: 49),
    end: Duration(seconds: 62),
  ),
  // Add more verses with precise timestamps
};