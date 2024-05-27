import 'package:acquire_lms_mobile_app/config/app_router.gr.dart';
import 'package:acquire_lms_mobile_app/models/book_model.dart';
import 'package:acquire_lms_mobile_app/provider/home_provider.dart';
import 'package:acquire_lms_mobile_app/utils/spaces.dart';
import 'package:acquire_lms_mobile_app/widgets/app_bar_widget.dart';
import 'package:acquire_lms_mobile_app/widgets/book_widget.dart';
import 'package:acquire_lms_mobile_app/widgets/screen_title_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  HomeProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeProvider>(context, listen: false);
    _provider?.getBooks();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getBooksApi();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, widget) => SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Scaffold(
            // floatingActionButton: _floatingActionWidget(),
            appBar: AppBar(
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.red),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: const Color(0xFF909090),
                  height: 4.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 13.0),
                ),
              ),
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 80,
              title: const Row(
                children: [
                  AcquireTitle(),
                ],
              ),
            ),

            endDrawer: _buildAppDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  verticalSpacing(25),
                  const ScreenHeader(headerText: 'Book Collection'),
                  verticalSpacing(15),
                  TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for books...'),
                    onSubmitted: (value) {
                      if (value.trim().isEmpty) {
                        return; // Do nothing if the input is empty or just whitespace
                      }
                      _provider?.query = value;
                      _provider?.books.clear();
                      _getBooksApi();
                    },
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      itemCount: provider.books.length,
                      itemBuilder: (context, position) {
                        final book = provider.books[position];
                        return InkWell(
                          onTap: () {
                            _openBookDetail(book);
                          },
                          child: BookWidget(
                            title: book.title,
                            subtitle: book.subtitle ?? book.description,
                            thumbnail: book.thumbnail,
                            author:
                                book.authors?.join(", ") ?? "Unknown Author",
                            availableCopies: book.availableCopies,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Color(0xffDADADA)),
                    ),
                  ),
                  if (provider.isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Books'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Add other ListTiles for the rest of the menu items
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Book Request'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections_bookmark),
            title: const Text('Book Collection'),
            onTap: () {
              //  CollectionRoute here
              context.pushRoute(const CollectionRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Book Catalog'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Department Curriculum'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _openBookDetail(BookModel book) {
    context.pushRoute(BookDetailRoute(bookId: book.id));
  }

  void _getBooksApi() {
    _provider?.showLoading();
    _provider?.getBooks();
  }
}
