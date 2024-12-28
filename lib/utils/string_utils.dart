String truncateTo({required String text, int to = 18}) {
  return text.length > to ? '${text.substring(0, to)}...' : text;
}
