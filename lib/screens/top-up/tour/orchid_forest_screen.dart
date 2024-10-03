import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/tour/ticket_order_widget.dart';

class OrchidForestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GenericTourScreen(
        tourName: 'Orchid Forest',
        location: 'Lembang, Jawa Barat',
        bannerImagePaths: [
          "assets/images/banner/tours/orchid_forest/orchid1.png",
          "assets/images/banner/tours/orchid_forest/orchid2.png",
          "assets/images/banner/tours/orchid_forest/orchid3.png",
        ],
        operationalHours: '08:00 - 17:00',
        termsAndConditions: [
          'Tiket berlaku sesuai tanggal kunjungan yang dipilih.',
          'Tiket tidak dapat ditukar (non-reschedule) atau dikembalikan (non-refundable).',
          'Tiket anak berlaku untuk usia mulai 2-12 Tahun.',
        ],
        additionalInfo: [
          '1. Pastikan e-ticket Anda sudah siap untuk ditunjukkan sebelum memasuki area rekreasi.',
          '2. Tunjukkan kode QR e-ticket untuk discan oleh petugas untuk ditukar dengan wristband.',
        ],
        adultTicketPrice: 50000, // Misalnya, harga tiket dewasa
        childTicketPrice: 25000, // Misalnya, harga tiket anak
      ),
    );
  }
}
