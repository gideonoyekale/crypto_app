extension StringExtention on String {
  String appendOverflow(int len) {
    if (length > len) {
      return '${substring(0, len)}...';
    } else {
      return this;
    }
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
