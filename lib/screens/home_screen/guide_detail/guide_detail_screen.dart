// ignore_for_file: library_private_types_in_public_api

import 'package:casino_da_povoa/cubit/auth_cubit/auth_cubit.dart';
import 'package:casino_da_povoa/cubit/places_cubit.dart';
import 'package:casino_da_povoa/screens/home_screen/guide_review/guide_review.dart';
import 'package:casino_da_povoa/screens/home_screen/tabs/articles_screen.dart';
import 'package:casino_da_povoa/widgets/sign_in_modal_window/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:casino_da_povoa/models/places_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuideDetailScreen extends StatefulWidget {
  final Guide guide;

  const GuideDetailScreen({super.key, required this.guide});

  @override
  _GuideDetailScreenState createState() => _GuideDetailScreenState();
}

class _GuideDetailScreenState extends State<GuideDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SignInDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              padding: const EdgeInsets.only(left: 16.0),
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            titleSpacing: 0,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Guide",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: BlocBuilder<GuideCubit, GuideState>(
                  builder: (context, state) {
                    final isFavourite =
                        state.favouriteGuides.contains(widget.guide);
                    return Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color:
                          isFavourite ? const Color(0xFFFFB639) : Colors.grey,
                    );
                  },
                ),
                onPressed: () {
                  final cubit = context.read<GuideCubit>();
                  cubit.isFavourite(widget.guide)
                      ? cubit.removeFromFavourites(widget.guide)
                      : cubit.addToFavourites(widget.guide);
                },
              ),
              if (!state.isLoggedIn)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16.0,
                  ),
                  child: GestureDetector(
                    onTap: () => _showSignInDialog(context),
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB639),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGuideInfo(),
                    _buildCategoryTabs(),
                    _buildPlacesList(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGuideInfo() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 120.0,
            height: 120.0,
            child: Image.asset(
              widget.guide.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.guide.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GuideReview(
                  guide: widget.guide,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.guide.rate.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFB639),
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFB639),
                  size: 18,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFFB639),
                  size: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            widget.guide.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return TabBar(
      controller: _tabController,
      labelColor: const Color(0xFFFFB639),
      unselectedLabelColor: const Color(0xFF999999),
      indicatorColor: const Color(0xFFFFB639),
      tabs: const [
        Tab(text: 'Culture'),
        Tab(text: 'Beach'),
        Tab(text: 'Gastronomy'),
      ],
    );
  }

  Widget _buildPlacesList() {
    return SizedBox(
      height: 400,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildPlaceCards(widget.guide.categories.culture.items),
          _buildPlaceCards(widget.guide.categories.beach.items),
          _buildPlaceCards(widget.guide.categories.gastronomy.items),
        ],
      ),
    );
  }

  Widget _buildPlaceCards(List<Item> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GuideDetailsScreen(item: item),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    child: Image.asset(
                      item.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
