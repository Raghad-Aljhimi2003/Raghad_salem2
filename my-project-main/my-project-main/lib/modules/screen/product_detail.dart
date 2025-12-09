// lib/modules/screen/product_detail.dart
import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    Widget imagePart = Hero(
      tag: product.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          product.image,
          fit: BoxFit.cover,
          errorBuilder: (context, e, s) => Container(color: Colors.grey.shade200, child: const Center(child: Icon(Icons.broken_image, size: 40))),
        ),
      ),
    );

    Widget detailsPart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Row(children: List.generate(5, (i) => Icon(i < 3 ? Icons.star : Icons.star_border, color: Colors.orange[700]))),
        const SizedBox(height: 12),
        Text('السعر: ${product.price.toStringAsFixed(0)} ر.س', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const Text('وصف المنتج:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: const TextStyle(height: 1.4),
        ),

        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.shopping_cart_checkout,color: Colors.white,),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text('شراء', style:TextStyle(color: Colors.white,fontSize: 15)),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB36A31),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),shadowColor: Colors.brown),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('تم الطلب'),
                  content: const Text('شكراً! تم تأكيد طلبك بنجاح.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('حسناً')),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFFB36A31),
        title: const Text('تفاصيل المنتج',style: TextStyle(color:Colors.white ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),color:Colors.white , // زر الرجوع صريح
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            color: Colors.white,
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('مشاركة (لم تُفعّل بعد)'))),
          )
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.all(14.0),
        child: isWide
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: AspectRatio(aspectRatio: 4 / 3, child: imagePart)),
            const SizedBox(width: 18),
            Expanded(flex: 6, child: SingleChildScrollView(child: detailsPart)),
          ],
        )
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(aspectRatio: 4 / 3, child: imagePart),
              const SizedBox(height: 12),
              detailsPart,
            ],
          ),
        ),
      ),
    );
  }
}
