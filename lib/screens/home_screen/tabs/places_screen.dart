import 'package:casino_da_povoa/cubit/entertainment_cubit/entertainment_cubit.dart';
import 'package:casino_da_povoa/cubit/hotels_cubit/hotels_cubit.dart';
import 'package:casino_da_povoa/models/entertainment_model.dart';
import 'package:casino_da_povoa/models/hotels_model.dart';
import 'package:casino_da_povoa/screens/home_screen/hotel_detail/hotel_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> categories = [
    {"name": "Hotels", "icon": Icons.hotel},
    {"name": "Entertainment", "icon": Icons.local_activity},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          _selectedIndex == -1 ? 'Places' : categories[_selectedIndex]["name"],
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: _selectedIndex == -1
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 30),
                onPressed: () {
                  setState(() {
                    _selectedIndex = -1;
                  });
                },
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
          _selectedIndex == -1 ? _buildCategoryGrid() : _buildSelectedScreen(),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categories[index]["icon"],
                    size: 50.0,
                    color: const Color(0xFFFFB639),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index]["name"],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectedScreen() {
    return _selectedIndex == 0
        ? const HotelsScreen()
        : const EntertainmentScreen();
  }
}

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.error.isNotEmpty) {
                return Center(child: Text('Error: ${state.error}'));
              }

              final List<Widget> hotelWidgets = [];

              if (state.favouriteHotels.isNotEmpty) {
                hotelWidgets.add(const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ));
                hotelWidgets.addAll(
                  state.favouriteHotels
                      .map((hotel) => HotelCard(hotel: hotel))
                      .toList(),
                );
              }

              if (state.hotels.isNotEmpty) {
                hotelWidgets.add(const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'All Hotels',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ));
                hotelWidgets.addAll(
                  state.hotels.map((hotel) => HotelCard(hotel: hotel)).toList(),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: hotelWidgets,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HotelCubit>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(hotel: hotel),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                hotel.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 18, color: Color(0xFF1E1E1E)),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "13/15 Mós Street, 4480-771 Vila do Conde, Portugal",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 11, color: Color(0XFF6F7789)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotel.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Row(
                        children: [
                          Text(
                            hotel.rate.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFB639),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hotel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0XFF939393)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '€ ${hotel.pricePerNight}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFB639),
                        ),
                      ),
                      const Text(
                        '/night',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF939393),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({super.key});

  @override
  _EntertainmentScreenState createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: BlocBuilder<EntertainmentCubit, EntertainmentState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          }

          return Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                tabs: const [
                  Tab(text: 'Water'),
                  Tab(text: 'Cafe'),
                  Tab(text: 'Festival'),
                  Tab(text: 'Others'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildEntertainmentList(state.entertainment.water.items),
                    _buildEntertainmentList(
                        state.entertainment.restaurants.items.cast<EntrItem>()),
                    _buildEntertainmentList(
                        state.entertainment.festival.items.cast<EntrItem>()),
                    _buildEntertainmentList(
                        state.entertainment.others.items.cast<EntrItem>()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEntertainmentList(List<EntrItem> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No events available"));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return EntertainmentCard(item: items[index]);
      },
    );
  }
}

class EntertainmentCard extends StatelessWidget {
  final EntrItem item;

  const EntertainmentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EntertainmentDetailScreen(item: item),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                item.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EntertainmentDetailScreen extends StatelessWidget {
  final EntrItem item;

  const EntertainmentDetailScreen({super.key, required this.item});

  void _shareEntertainment() {
    final String shareText = '''
Check out this place: ${item.title}

${item.description}
''';

    Share.share(shareText);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EntertainmentCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Entertainments",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareEntertainment,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/app_background.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      item.image,
                      width: double.infinity,
                      height: 330,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 105),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

