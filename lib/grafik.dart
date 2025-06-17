import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikScreen extends StatelessWidget {
  const GrafikScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: const Color(0xFFAF3E3E),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavItem(icon: Icons.thumb_up_alt_rounded, label: "For You"),
            BottomNavItem(icon: Icons.shopping_bag_rounded, label: "Bag"),
            BottomNavItem(icon: Icons.list_alt_rounded, label: "Transaction"),
            BottomNavItem(icon: Icons.account_circle_rounded, label: "Account"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/hulk.jpg'),
                ),
                SizedBox(width: 12),
                Text(
                  'Halo SemogaBisaNgoding',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Grafik Aktivitas Belanja',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Lihat bagaimana pola belanjamu selama beberapa bulan terakhir.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barGroups: List.generate(7, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: (index + 1).toDouble(),
                          width: 12,
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFD65C5C)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ],
                    );
                  }),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        reservedSize: 28,
                        getTitlesWidget:
                            (value, meta) => Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final days = [
                            'Sun',
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                          ];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              value.toInt() < days.length
                                  ? days[value.toInt()]
                                  : '',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.circle, color: Color(0xFFD65C5C), size: 14),
                SizedBox(width: 4),
                Text('Hari ini'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.circle, color: Color(0xFFE5E3B8), size: 14),
                SizedBox(width: 4),
                Text('Hari sebelumnya'),
              ],
            ),
            const SizedBox(height: 12),

            // TABEL INFO DENGAN JARAK RAPAT
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: IntrinsicColumnWidth(), // label
                1: FixedColumnWidth(8), // titik dua
                2: FlexColumnWidth(), // isi
              },
              children: const [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        'Jumlah transaksi',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(':', style: TextStyle(color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '2 transaksi',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        'Total item dibeli',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(':', style: TextStyle(color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '2 item',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        'Nilai pembelian',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(':', style: TextStyle(color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        'Rp 12.000.000',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomNavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, color: Colors.white)),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
