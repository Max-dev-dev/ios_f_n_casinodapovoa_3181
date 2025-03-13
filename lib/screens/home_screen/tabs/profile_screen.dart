import 'package:casino_da_povoa/cubit/auth_cubit/auth_cubit.dart';
import 'package:casino_da_povoa/cubit/booking_cubit/booking_cubit.dart';
import 'package:casino_da_povoa/models/booking_model.dart';
import 'package:casino_da_povoa/widgets/sign_in_modal_window/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSignInDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const SignInDialog(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/app_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              if (!authState.isLoggedIn)
                Positioned(
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
              else
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 50,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "You are logged out successfully",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.all(16),
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    if (authState.isLoggedIn)
                      const Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    else
                      const Center(
                        child: Text(
                          "Please Sign In to view user information.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    const SizedBox(height: 6),
                    if (authState.isLoggedIn)
                      _buildInfoBox(authState.firstName),
                    const SizedBox(height: 20),
                    if (authState.isLoggedIn)
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    const SizedBox(height: 6),
                    if (authState.isLoggedIn)
                      _buildInfoBox(authState.phoneNumber),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade400, thickness: 1),
                    const SizedBox(height: 16),
                    if (authState.isLoggedIn)
                      const Text(
                        "My Bookings",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    const SizedBox(height: 8),
                    if (authState.isLoggedIn)
                      Expanded(
                        child: BlocBuilder<BookingCubit, BookingState>(
                          builder: (context, bookingState) {
                            if (bookingState.isLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (bookingState.bookings.isEmpty) {
                              return const Center(
                                  child: Text("No bookings found"));
                            }
                            return ListView.builder(
                              itemCount: bookingState.bookings.length,
                              itemBuilder: (context, index) {
                                final booking = bookingState.bookings[index];
                                return _buildBookingCard(booking, context);
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildBookingCard(Booking booking, BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.hotelTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "${booking.checkInDate} - ${booking.checkOutDate}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Time: ${booking.time}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.group, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Guests: ${booking.guests}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${booking.firstName} ${booking.lastName}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Booked deleted",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(16),
                        duration: const Duration(seconds: 4),
                      ),
                    );
                    context.read<BookingCubit>().removeBooking(booking);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
