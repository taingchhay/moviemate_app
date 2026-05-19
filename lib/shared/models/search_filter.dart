enum SearchFilter {
  all('All'),
  actors('Actors'),
  drama('Drama'),
  movies('Movies');

  final String displayName;

  const SearchFilter(this.displayName);
}
