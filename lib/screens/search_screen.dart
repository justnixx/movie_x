import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/components/detailed_movie_card.dart';
import 'package:movie_x/constants/strings.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/services/movie_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = false;
  List<Movie> moviesOrShows = [];
  final movieService = MovieService();
  final textController = TextEditingController();

  // Search for movies or shows based on the query provided
  void searchMovies(String query) async {
    setState(() {
      isLoading = true;
    });

    final returnedMovies = await movieService.searchMulti(query);

    setState(() {
      moviesOrShows = returnedMovies;

      isLoading = false;
    });
  }

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  // Handle the search bar's submission action
  void handleSubmit(String value) {
    // Check if the input is empty and notify the user if so
    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Search query cannot be empty.',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red.shade100),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));

      return;
    }

    // Perform the search with the given query
    searchMovies(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
        title: AppStrings.search,
      ),
      body: Column(
        children: [
          // Search bar for user input
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 60.5,
            child: SearchBar(
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search',
              elevation: const WidgetStatePropertyAll(0.0),
              hintStyle: WidgetStatePropertyAll(
                TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.secondary,
              ),
              controller: textController,
              onSubmitted: handleSubmit,
            ),
          ),

          // Search results count display
          SizedBox(
            height: 50,
            child: !isLoading && textController.text.isNotEmpty
                ? Text(
                    'Found (${moviesOrShows.length}) result${moviesOrShows.length == 1 ? '' : 's'}',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : null,
          ),

          // Display loading indicator or the list of search results
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: moviesOrShows.length,
                    itemBuilder: (context, index) {
                      final currentMovieOrShow = moviesOrShows[index];

                      return DetailedMovieCard(
                        movie: currentMovieOrShow,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
