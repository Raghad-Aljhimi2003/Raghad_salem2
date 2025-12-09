import 'package:flutter/material.dart';

class account extends StatelessWidget {
  const account({super.key});

  static const Color mainColor = Color(0xFFB36A31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حساب المتجر"),
        centerTitle: true,
        backgroundColor: mainColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [


            _section(
              child: _header(context),
            ),

            _divider(),


            _section(
              title: "مميزات المتجر",
              child: _features(),
            ),

            _divider(),


            _section(
              title: "عن المتجر",
              child: _aboutStore(),
            ),

            _divider(),


            _section(
              title: "إحصائيات",
              child: _statsRow(),
            ),

            _divider(),


            _section(
              title: "الموقع",
              child: _location(),
            ),

            _divider(),


            _section(
              title: "أسئلة شائعة",
              child: _faq(),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }



  Widget _header(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const AssetImage('assets/images/image.png'),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Flow Store",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 4),

                  Text(
                    "متجر متخصص في الساعات والاكسسوارات — جودة أصلية وخدمة سريعة",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      _starRow(4.5),
                      const SizedBox(width: 8),
                      Text("4.5 (1.2k تقييم)",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),


            Flexible(
              flex: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم متابعة المتجر")),
                  );
                },
                child: const Text("متابعة",style:TextStyle(color:Colors.white,fontSize: 15 )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _features() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        _FeatureChip(icon: Icons.local_shipping_outlined, label: "توصيل سريع"),
        _FeatureChip(icon: Icons.verified_outlined, label: "قطع أصلية"),
        _FeatureChip(icon: Icons.support_agent_outlined, label: "دعم 24/7"),
        _FeatureChip(icon: Icons.lock_outline, label: "دفع آمن"),
        _FeatureChip(icon: Icons.repeat, label: "استرجاع 14 يوم"),
      ],
    );
  }

  Widget _aboutStore() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          "Flow Store متجر رائد في مجال بيع الساعات الفاخرة والاكسسوارات الأصلية. "
              "نقدم أفضل المنتجات مع خدمة عملاء مميزة وتوصيل سريع. "
              "يمكنك التواصل معنا لأي استفسار أو طلب خاص.",
          style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.4),
        ),
      ),
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        _statItem("الطلبات", "3.4k"),
        _statItem("المتابعين", "12.1k"),
        _statItem("المنتجات", "245"),
      ],
    );
  }

  Widget _location() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.location_on_outlined),
        title: const Text("اليمن - حضرموت - المكلا"),
        subtitle: const Text("الموقع الرسمي"),
      ),
    );
  }

  Widget _faq() {
    return Column(
      children: [
        ExpansionTile(
          title: const Text("ماهي سياسة الاسترجاع؟"),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "يمكن إرجاع المنتج خلال 14 يومًا شرط أن يكون بحالته الأصلية.",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            )
          ],
        ),
        const Divider(),
        ExpansionTile(
          title: const Text("كم يستغرق التوصيل؟"),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "التوصيل داخل المدينة خلال 24–48 ساعة.",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            )
          ],
        ),
      ],
    );
  }



  Widget _section({String? title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          child,
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      thickness: 1,
      height: 0,
    );
  }

  static Widget _starRow(double value) {
    int full = value.floor();
    bool half = (value - full) >= 0.5;
    List<Widget> stars = [];
    for (int i = 0; i < full; i++) {
      stars.add(const Icon(Icons.star, size: 16, color: Colors.amber));
    }
    if (half) stars.add(const Icon(Icons.star_half, size: 16, color: Colors.amber));
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, size: 16, color: Colors.amber));
    }
    return Row(children: stars);
  }

  Widget _statItem(String label, String value) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: account.mainColor.withOpacity(0.12)),
      ),
      avatar: Icon(icon, size: 18, color: account.mainColor),
      label: Text(label, style: const TextStyle(fontSize: 13)),
    );
  }
}
