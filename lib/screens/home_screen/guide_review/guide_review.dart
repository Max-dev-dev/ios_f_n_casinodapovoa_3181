import 'package:casino_da_povoa/models/places_model.dart';
import 'package:flutter/material.dart';

class GuideReview extends StatelessWidget {
  final Guide guide;

  const GuideReview({
    required this.guide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
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
              "Reviews",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
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
                  const SizedBox(height: 16.0),
                  ..._buildReviews(),
                ],
              ),
            ),
          ],
        ),
      ),
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
              guide.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            guide.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  guide.rate.toString(),
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
            guide.description,
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

  List<Widget> _buildReviews() {
    return guide.reviews.map((review) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  review.reviewName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                _buildStarRating(review.rate),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              review.reviewText,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              review.reviewDate,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildStarRating(int rate) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color:
              index < rate ? const Color(0xFFFFB639) : const Color(0xFFC4C4C4),
          size: 16,
        );
      }),
    );
  }
}
