import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/widgets/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if(state is FeaturedBooksPagenagtionFailure){
          ErrorSnackbar.show(context, state.errmsg);
        }
      },
      builder: (context, state) {
        return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          builder: (context, state) {
            if (state is FeaturedBooksSuccess ||
                state is FeaturedBooksPagenagtionLoading||
                state is FeaturedBooksPagenagtionFailure
                ) {
              return FeaturedBooksListView(
                books: books,
              );
            } else if (state is FeaturedBooksFailure) {
              return Text(state.errmsg);
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
