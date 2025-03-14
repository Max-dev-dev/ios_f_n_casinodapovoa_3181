import 'package:casino_da_povoa/cubit/auth_cubit/auth_cubit.dart';
import 'package:casino_da_povoa/cubit/booking_cubit/booking_cubit.dart';
import 'package:casino_da_povoa/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text(
          'My Bookings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (!authState.isLoggedIn) {
            return const Center(
              child: Text(
                "Please sign in to view your bookings.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }
          return BlocBuilder<BookingCubit, BookingState>(
            builder: (context, bookingState) {
              if (bookingState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (bookingState.bookings.isEmpty) {
                return const Center(child: Text("No bookings found"));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bookingState.bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookingState.bookings[index];
                  return _buildBookingCard(booking, context);
                },
              );
            },
          );
        },
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
                          "Booking deleted",
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
