import 'package:flutter/material.dart';
import 'package:midterm_project/screens/wallet/credit_card.dart';


void navigateToCCInputScreen(BuildContext context) {

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CreditCardInputScreen()),
  );
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title for Payment Method Section
              const Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),

              // Payment Method Section
              SectionCard(
                title: 'Simpan kartu bank anda!',
                subtitle: 'Transaksi menjadi lebih mudah dan tidak merepotkan.',
                actionLabel: '+ ADD',
                onPressed: () => navigateToCCInputScreen(context),
              ),
              const SizedBox(height: 20),

              // Title for Investment Section
              const Text(
                'Investasi',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),

              // Investment Section
              SectionCard(
                title: 'Saatnya berinvestasi!',
                subtitle: 'Mulailah berinvestasi bahkan dari jumlah yang kecil.',
                actionLabel: '+ ADD',
                onPressed: () {

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InvestmentBottomSheet(); 
                    },
                  );
                },
              ),
              const SizedBox(height: 20),


              const Text(
                'Tiket & Voucher',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),

              SectionCard(
                title: 'Tiket & Voucher',
                subtitle: 'Temukan juga voucher & tiket perjalanan anda di sini.',
                actionLabel: 'PURCHASE',
                onPressed: ()  {

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return VoucherBottomSheet(); 
                    },
                  );
                },
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }
}

class InvestmentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 180, 
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilihlah jenis investasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.savings, size: 40, color: Colors.amber),
                  SizedBox(height: 8),
                  Text('FundGold'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.flag, size: 40, color: Colors.redAccent),
                  SizedBox(height: 8),
                  Text('FundWallet Goals'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VoucherBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 180, 
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilihlah voucher atau tiket',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.discount_rounded, size: 40, color: Colors.orangeAccent),
                  SizedBox(height: 8),
                  Text('FundDeals'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.airplane_ticket, size: 40, color: Colors.blueAccent),
                  SizedBox(height: 8),
                  Text('FundTrips'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onPressed;

  const SectionCard({
    super.key,  
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onPressed,  
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: onPressed,  // Attach the passed callback
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
