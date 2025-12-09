// lib/modules/screen/product.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_detail.dart';

class ProductModel {
  final String id;
  final String title;
  final String image; // asset path
  final double price;
  final String description;

  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });
}

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);


  final List<ProductModel> products = const [
    ProductModel(id: 'p1', title: 'ساعة رجالية رولكس', image: 'assets/images/imeg1.jpg', price: 199,description:"تجسّد هذه الساعة الرجالية من رولكس المعنى الحقيقي للفخامة والدقة. تأتي بتصميم راقٍ يجمع بين القوة والكلاسيكية، مع علبة مصقولة بعناية من الفولاذ المقاوم للصدأ Oystersteel المعروف بصلابته ولمعانه الدائم."),
    ProductModel(id: 'p2', title: 'ساعة رجالية اوميقا', image: 'assets/images/imeg2.jpg', price: 249,description:'تجمع هذه الساعة الرجالية من أوميغا (OMEGA) بين الأداء العالي والتصميم المميز الذي يعكس خبرة عريقة في صناعة الساعات السويسرية. تأتي بعلبة متقنة الصنع من الفولاذ المقاوم للصدأ، مع خطوط انسيابية تعطي الساعة طابعاً رياضياً أنيقاً يناسب مختلف الإطلالات.'),
    ProductModel(id: 'p3', title: 'ساعة رجالية اوميقا', image: 'assets/images/imeg3.jpg', price: 329,description:'تجمع هذه الساعة الرجالية من أوميغا (OMEGA) بين الأداء العالي والتصميم المميز الذي يعكس خبرة عريقة في صناعة الساعات السويسرية. تأتي بعلبة متقنة الصنع من الفولاذ المقاوم للصدأ، مع خطوط انسيابية تعطي الساعة طابعاً رياضياً أنيقاً يناسب مختلف الإطلالات.'),
    ProductModel(id: 'p4', title: 'ساعة رجالية باتيك فيلب', image: 'assets/images/imeg4.jpg', price: 179,description:'تُجسّد ساعة باتيك فيليب الرجالية قمّة الحرفية السويسرية والفخامة الراقية التي لا تحتاج تعريفاً. صُنعت بعلبة أنيقة ذات تفاصيل مصقولة بدقّة متناهية، ما يمنحها حضوراً مميزاً وجاذبية استثنائية تعكس شخصية رجل يقدّر الذوق الرفيع.'),
    ProductModel(id: 'p5', title: 'ساعة اوميقا سي ماستر ', image: 'assets/images/imeg5.jpg', price: 79,description:'تأتي أوميغا سي ماستر بتصميم يجمع بين الأناقة والقوة، لتكون الرفيق المثالي للرجل العصري سواء في البر أو البحر. تتميز بعلبة متينة من الفولاذ المقاوم للصدأ بلمسات مصقولة تمنح الساعة حضوراً فاخراً وملفتاً.'),
    ProductModel(id: 'p6', title: 'ساعة اوديمار بيجه', image: 'assets/images/imeg6.jpg', price: 289,description:'تعكس ساعة أوديمار بيغه الرجالية مزيجاً استثنائياً من الفخامة الجريئة والهندسة الدقيقة، في تصميم يُعد من أكثر التصاميم تميّزاً في عالم الساعات السويسرية. تأتي الساعة بعلبة هندسية أيقونية—خصوصاً في موديل Royal Oak—ذات إطار مثمّن ببراغي ظاهرة تمنحها شخصية قوية لا تشبه أي ساعة أخرى.'),
    ProductModel(id: 'p7', title: 'ساعة رجالية رولكس اوتاماتيك', image: 'assets/images/imeg7.jpg', price: 199,description:'تجمع ساعة رولكس الأوتوماتيك الرجالية بين الفخامة الخالدة والدقة الهندسية التي تشتهر بها رولكس عبر تاريخها العريق. تأتي بعلبة مصنوعة من الفولاذ المقاوم للصدأ Oystersteel، المعروف بقوته ولمعانه الذي يدوم لسنوات طويلة دون أن يفقد بريقه.'),
    ProductModel(id: 'p8', title: 'ساعة رجالية رولكس ستاربوكس', image: 'assets/images/imeg8.jpg', price: 249,description:'تُعد رولكس ستاربوكس واحدة من أكثر موديلات السوبمارينر تميّزاً وطلباً، حيث تجمع بين الأناقة الكلاسيكية للـ Submariner مع لمسة عصرية جريئة بفضل الإطار الأخضر المميز الذي منحها لقب “Starbucks” بين عشاق الساعات.'),
    ProductModel(id: 'p9', title: 'ساعة رجالية اوميقا', image: 'assets/images/imeg9.jpg', price: 329,description:'تجمع هذه الساعة الرجالية من أوميغا (OMEGA) بين الأداء العالي والتصميم المميز الذي يعكس خبرة عريقة في صناعة الساعات السويسرية. تأتي بعلبة متقنة الصنع من الفولاذ المقاوم للصدأ، مع خطوط انسيابية تعطي الساعة طابعاً رياضياً أنيقاً يناسب مختلف الإطلالات.'),
    ProductModel(id: 'p10', title: ' ساعة رجالية باتيك فيلب هوائي', image: 'assets/images/imeg10.jpg', price: 179,description:'تجمع ساعة باتيك فيلب الهوائي – Aquanaut بين البساطة الراقية والطابع الرياضي العصري، لتقدّم أحد أكثر الموديلات تميّزاً في عالم الساعات الفاخرة. تأتي الساعة بعلبة مصنوعة بدقة من الفولاذ المقاوم للصدأ، بلمسات مصقولة تمنحها مظهراً حديثاً وخفيفاً يناسب أسلوب الرجل العصري.'),
    ProductModel(id: 'p11', title: 'ساعة اوميقا سي ماستر ', image: 'assets/images/imeg11.jpg', price: 79,description:'تأتي أوميغا سي ماستر بتصميم يجمع بين الأناقة والقوة، لتكون الرفيق المثالي للرجل العصري سواء في البر أو البحر. تتميز بعلبة متينة من الفولاذ المقاوم للصدأ بلمسات مصقولة تمنح الساعة حضوراً فاخراً وملفتاً.'),
    ProductModel(id: 'p12', title: 'ساعة رولكس كبلز', image: 'assets/images/imeg12.jpg', price: 289,description:'تجسّد هذه الساعة الرجالية من رولكس المعنى الحقيقي للفخامة والدقة. تأتي بتصميم راقٍ يجمع بين القوة والكلاسيكية، مع علبة مصقولة بعناية من الفولاذ المقاوم للصدأ Oystersteel المعروف بصلابته ولمعانه الدائم.'),
    ProductModel(id: 'p13', title: 'ساعة رجالية اوميقا سي ماستر اوشن', image: 'assets/images/imeg13.jpg', price: 199,description:'ساعة رجالية اوميقا سي ماستر اوشن'),
    ProductModel(id: 'p14', title: 'ساعة رجالية رولكس بطارية', image: 'assets/images/imeg14.jpg', price: 249,description:'تُعد رولكس Oysterquartz واحدة من أكثر الساعات تميّزاً في تاريخ رولكس، إذ تجمع بين تصميم رولكس الفاخر وحركة Quartz عالية الدقة تعمل بالبطارية—وهو أمر نادر جداً في عالم رولكس.'),
    ProductModel(id: 'p15', title: 'ساعة رجالية اوميقا', image: 'assets/images/imeg15.jpg', price: 329,description:'تجمع ساعة أوميغا الرجالية بين الفخامة السويسرية والأداء العملي المتطور، مما يجعلها خياراً مثالياً للرجل الذي يبحث عن الأناقة مع القوة والدقة. تأتي الساعة بعلبة متينة من الفولاذ المقاوم للصدأ بلمسات مصقولة تمنحها مظهراً راقياً يدوم لسنوات.'),
    ProductModel(id: 'p16', title: 'ساعة رجالية اوميقا بطارية', image: 'assets/images/imeg16.jpg', price: 249,description: 'تأتي ساعة أوميغا البطارية كخيار يجمع بين الفخامة السويسرية الكلاسيكية والدقّة العالية التي تشتهر بها ساعات الكوارتز. تتميز بعلبة مصنوعة من الفولاذ المقاوم للصدأ، بتشطيبات مصقولة بإتقان تمنح الساعة مظهراً راقياً يناسب مختلف الإطلالات اليومية والرسمية.')
  ];

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  final Map<String, int> _ratings = {};

  @override
  void initState() {
    super.initState();
    _loadRatings();
  }

  Future<void> _loadRatings() async {
    final prefs = await SharedPreferences.getInstance();
    for (final p in widget.products) {
      final key = 'rating_${p.id}';
      final value = prefs.getInt(key);
      _ratings[p.id] = value ?? 3;
    }
    if (mounted) setState(() {});
  }

  Future<void> _saveRating(String productId, int rating) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('rating_$productId', rating);
    _ratings[productId] = rating;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFFB36A31),
        title: const Text('المنتجات',style: TextStyle(color:Colors.white ),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('فتح العربة'))),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: widget.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final p = widget.products[index];
            final currentRating = _ratings[p.id] ?? 3;
            return ProductCard(
              product: p,
              initialRating: currentRating,
              onRatingChanged: (newRating) => _saveRating(p.id, newRating),
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailPage(product: p)));
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int initialRating;
  final void Function(int) onRatingChanged;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.initialRating,
    required this.onRatingChanged,
    required this.onTap,
  }) : super(key: key);

  Widget _imageWidget(String path) {

    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], child: const Icon(Icons.broken_image)),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _rating = initialRating;

    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(14),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              color: Colors.white,
              child: Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),


            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: product.id,
                      child: _imageWidget(product.image),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
                      child: Text('${product.price.toStringAsFixed(0)} ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  StatefulBuilder(builder: (context, setStateStar) {
                    return Row(children: List.generate(5, (i) {
                      final filled = i < _rating;
                      return GestureDetector(
                        onTap: () {
                          final selected = i + 1;
                          setStateStar(() {
                            if (_rating == selected) {
                              _rating = 0;
                            } else {
                              _rating = selected;
                            }
                          });
                          onRatingChanged(_rating);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            filled ? Icons.star : Icons.star_border,
                            size: 16,
                            color: filled ? Colors.orange[700] : Colors.grey,
                          ),
                        ),
                      );
                    }));
                  }),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('أضيف ${product.title} إلى العربة')));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.add_shopping_cart_outlined, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
