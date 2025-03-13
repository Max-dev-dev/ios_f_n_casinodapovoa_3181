import 'package:casino_da_povoa/cubit/places_cubit.dart';
import 'package:casino_da_povoa/screens/home_screen/tabs/articles_screen.dart';
import 'package:casino_da_povoa/screens/home_screen/tabs/dictionary_screen.dart';
import 'package:casino_da_povoa/screens/home_screen/tabs/places_screen.dart';
import 'package:casino_da_povoa/screens/home_screen/tabs/profile_screen.dart';
import 'package:casino_da_povoa/widgets/guide_card/guide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PlacesScreen(),
    const DictionaryScreen(),
    const ArticlesScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFFFB639),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Guides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 24),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, size: 24),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, size: 24),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/app_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              title: const Text(
                'Guides Da Povoa',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            backgroundColor: const Color(0xFFF2F2F2),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/app_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<GuideCubit, GuideState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state.error.isNotEmpty) {
                          return Center(child: Text('Error: ${state.error}'));
                        }

                        final List<Widget> guideWidgets = [];

                        if (state.favouriteGuides.isNotEmpty) {
                          guideWidgets.add(const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Favourites',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ));
                          guideWidgets.addAll(
                            state.favouriteGuides
                                .map((guide) => GuideCard(guide: guide))
                                .toList(),
                          );
                        }

                        if (state.guides.isNotEmpty) {
                          guideWidgets.add(const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'All guides',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ));
                          guideWidgets.addAll(
                            state.guides
                                .map((guide) => GuideCard(guide: guide))
                                .toList(),
                          );
                        }

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: guideWidgets,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
