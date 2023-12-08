extension DateTimeExtension on DateTime {
  String get timeAgo {
    // 24 hours ago turns a day ago (1d. ago).
    // 7 days ago turns a week ago (1w. ago).
    // 5 weeks ago turns a month ago (1m. ago).
    // 12 months ago turns a year ago (1y. ago).
    // However, timestamp should work according to user timezones
    final dateTime = this;
    String returnText = 'now';
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inDays >= 31 && diff.inDays < 365) {
      final month = (diff.inDays / 31).floor();
      returnText = month == 1 ? '1 month ago' : '$month months ago';
    } else if (diff.inDays > 1 && diff.inDays <= 31) {
      returnText = diff.inDays == 1
          ? 'Yesterday'
          : diff.inDays == 7
              ? '1 week ago'
              : '${diff.inDays.toString()} days ago';
    } else if (diff.inHours >= 1 && diff.inDays < 1) {
      returnText = diff.inHours == 1
          ? "1 hour ago"
          : '${diff.inHours.toString()} hours ago';
    } else if (diff.inMinutes >= 1 && diff.inMinutes < 60) {
      returnText = diff.inMinutes == 1
          ? "1 min ago"
          : '${diff.inMinutes.toString()} mins ago';
    } else if (diff.inSeconds > 1 && diff.inSeconds < 60) {
      return 'now';
    }
    return returnText;
  }

  bool isSameDayAs(DateTime date) {
    return date.year == year && date.month == month && date.day == day;
  }
}
