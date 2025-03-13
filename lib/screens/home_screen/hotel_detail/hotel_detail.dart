import 'package:casino_da_povoa/cubit/auth_cubit/auth_cubit.dart';
import 'package:casino_da_povoa/cubit/hotels_cubit/hotels_cubit.dart';
import 'package:casino_da_povoa/models/hotels_model.dart';
import 'package:casino_da_povoa/widgets/hotel_booking_dialog/hotel_booking_dialog.dart';
import 'package:casino_da_povoa/widgets/sign_in_modal_window/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailScreen({super.key, required this.hotel});

  void _showHotelBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const HotelBookingDialog(),
    );
  }

  void _showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SignInDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    void _shareHotel() {
      final String shareText = '''
Check out this hotel: ${hotel.title}

📍 Address: 13/15 Mós Street, 4480-771 Vila do Conde, Portugal
⭐ Rating: ${hotel.rate}
💰 Price: €${hotel.pricePerNight} / night

${hotel.description}
''';

      Share.share(shareText);
    }

    final cubit = context.read<HotelCubit>();

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
            "Hotels",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            icon: BlocBuilder<HotelCubit, HotelState>(
              builder: (context, state) {
                final isFavourite = cubit.isFavourite(hotel);
                return Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: isFavourite ? const Color(0xFFFFB639) : Colors.grey,
                );
              },
            ),
            onPressed: () {
              cubit.isFavourite(hotel)
                  ? cubit.removeFromFavourites(hotel)
                  : cubit.addToFavourites(hotel);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareHotel(),
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
                      hotel.image,
                      width: double.infinity,
                      height: 330,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '€ ${hotel.pricePerNight}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFB639),
                            ),
                          ),
                          const Text(
                            '/night',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF939393),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            hotel.rate.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFB639),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hotel.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hotel.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 105),
                ],
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return !state.isLoggedIn
                  ? Positioned(
                      left: 16,
                      right: 16,
                      bottom: 50,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _showSignInDialog(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFB639),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      left: 16,
                      right: 16,
                      bottom: 50,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _showHotelBookingDialog(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFB639),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Book",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
