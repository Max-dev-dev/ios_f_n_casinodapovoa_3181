import 'package:casino_da_povoa/cubit/booking_cubit/booking_cubit.dart';
import 'package:casino_da_povoa/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelBookingDialog extends StatefulWidget {
  const HotelBookingDialog({super.key});

  @override
  _HotelBookingDialogState createState() => _HotelBookingDialogState();
}

class _HotelBookingDialogState extends State<HotelBookingDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int guestsCount = 2;
  DateTimeRange? selectedDateRange;
  TimeOfDay selectedTime = const TimeOfDay(hour: 20, minute: 0);

  void _pickDateRange() async {
    final DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                _buildDateTimePicker(),
                const SizedBox(height: 16),
                _buildGuestsSelector(),
                const SizedBox(height: 16),
                _buildLabel(
                  "Guest details",
                ),
                const SizedBox(height: 12),
                _buildTextField(_firstNameController, "First name"),
                const SizedBox(height: 12),
                _buildTextField(_lastNameController, "Last name"),
                const SizedBox(height: 12),
                _buildPhoneNumberField(),
                const SizedBox(height: 24),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Hotel booking",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildDateTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPickerButton(
          label: "Date",
          value: selectedDateRange != null
              ? "${selectedDateRange!.start.day} ${_getMonthAbbreviation(selectedDateRange!.start.month)} - ${selectedDateRange!.end.day} ${_getMonthAbbreviation(selectedDateRange!.end.month)}"
              : "Select date",
          onTap: _pickDateRange,
        ),
        const SizedBox(height: 16),
        _buildPickerButton(
          label: "Time",
          value: selectedTime.format(context),
          onTap: _pickTime,
        ),
      ],
    );
  }

  Widget _buildPickerButton(
      {required String label,
      required String value,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestsSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Guests",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                if (guestsCount > 1) {
                  setState(() {
                    guestsCount--;
                  });
                }
              },
            ),
            Text(
              guestsCount.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  guestsCount++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$hint is required";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number is required";
        }
        if (!RegExp(r'^\+\d{1,3}\d{4,14}$').hasMatch(value)) {
          return "Enter a valid phone number (e.g., +123456789)";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: "+44123456789",
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final booking = Booking(
              hotelTitle:
                  "Venceslau Wine Boutique Hostel",
              checkInDate: selectedDateRange != null
                  ? "${selectedDateRange!.start.day}/${selectedDateRange!.start.month}/${selectedDateRange!.start.year}"
                  : "N/A",
              checkOutDate: selectedDateRange != null
                  ? "${selectedDateRange!.end.day}/${selectedDateRange!.end.month}/${selectedDateRange!.end.year}"
                  : "N/A",
              time: selectedTime.format(context),
              guests: guestsCount,
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              phoneNumber: _phoneController.text,
            );

            context.read<BookingCubit>().addBooking(booking);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Booking successfully saved!"),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.of(context).pop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  String _getMonthAbbreviation(int month) {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }
}
