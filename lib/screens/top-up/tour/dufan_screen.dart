import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/tour/ticket_order_widget.dart';

class DufanAncolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GenericTourScreen(
        tourName: 'Dufan Ancol',
        location: 'Ancol, Jakarta Utara',
        bannerImagePaths: [
          "assets/images/banner/tours/dufan/dufan2.png",
          "assets/images/banner/tours/dufan/dufan1.png",
        ],
        operationalHours: '10:00 - 18:00',
        termsAndConditions: [
          'Tiket berlaku sesuai tanggal kunjungan yang dipilih.',
          'Tiket tidak dapat ditukar (non-reschedule) atau dikembalikan (non-refundable).',
          'Tiket anak berlaku untuk usia mulai 2-12 Tahun.',
        ],
        additionalInfo: [
          '1. Pastikan e-ticket Anda sudah siap untuk ditunjukkan sebelum memasuki area rekreasi.',
          '2. Tunjukkan kode QR e-ticket untuk discan oleh petugas untuk ditukar dengan wristband.',
        ],
        adultTicketPrice: 70000, // Misalnya, harga tiket dewasa
        childTicketPrice: 34000, // Misalnya, harga tiket anak
      ),
    );
  }
}
