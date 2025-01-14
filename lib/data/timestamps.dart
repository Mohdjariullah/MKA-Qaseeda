// ignore_for_file: prefer_const_constructors

class VerseTimestamp {
  final Duration start;
  final Duration end;

  VerseTimestamp({required this.start, required this.end});
}

final Map<int, VerseTimestamp> verseTimestamps = {
  1: VerseTimestamp(
    start: Duration(seconds: 14),
    end: Duration(seconds: 22),
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
  5: VerseTimestamp(
    start: Duration(seconds: 63),
    end: Duration(seconds: 75),
  ),
  6: VerseTimestamp(
    start: Duration(seconds: 76),
    end: Duration(seconds: 88),
  ),
  7: VerseTimestamp(
    start: Duration(seconds: 89),
    end: Duration(seconds: 102),
  ),
  8: VerseTimestamp(
    start: Duration(seconds: 103),
    end: Duration(seconds: 116),
  ),
  9: VerseTimestamp(
    start: Duration(seconds: 117),
    end: Duration(seconds: 130),
  ),
  10: VerseTimestamp(
    start: Duration(seconds: 131),
    end: Duration(seconds: 144),
  ),
  11: VerseTimestamp(
    start: Duration(seconds: 145),
    end: Duration(seconds: 158),
  ),
  12: VerseTimestamp(
    start: Duration(seconds: 159),
    end: Duration(seconds: 172),
  ),
  13: VerseTimestamp(
    start: Duration(seconds: 173),
    end: Duration(seconds: 186),
  ),
  14: VerseTimestamp(
    start: Duration(seconds: 187),
    end: Duration(seconds: 200),
  ),
  15: VerseTimestamp(
    start: Duration(seconds: 201),
    end: Duration(seconds: 214),
  ),
  16: VerseTimestamp(
    start: Duration(seconds: 215),
    end: Duration(seconds: 228),
  ),
  17: VerseTimestamp(
    start: Duration(seconds: 229),
    end: Duration(seconds: 242),
  ),
  18: VerseTimestamp(
    start: Duration(seconds: 243),
    end: Duration(seconds: 256),
  ),
  19: VerseTimestamp(
    start: Duration(seconds: 257),
    end: Duration(seconds: 270),
  ),
  20: VerseTimestamp(
    start: Duration(seconds: 271),
    end: Duration(seconds: 284),
  ),
  // Continue adding timestamps for all your verses
};}