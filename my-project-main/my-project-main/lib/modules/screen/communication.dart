import 'package:flutter/material.dart';

class communication extends StatefulWidget {
  const communication({super.key});

  @override
  State<communication> createState() => _communicationState();
}

class _communicationState extends State<communication> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController msgCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final Color mainColor = const Color(0xFFB36A31);

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),

      appBar: AppBar(
        title: const Text("التواصل"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 28, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "مرحباً بك!",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "إذا احتجت أي مساعدة أو لديك استفسار، اكتب لنا رسالة وسنرد عليك في أقرب وقت. نحن هنا لخدمتك ",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),


            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "أرسل رسالة",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),

                  const SizedBox(height: 12),


                  _fieldCard(
                    child: TextFormField(
                      controller: nameCtrl,
                      decoration: _inputStyle("الاسم", "اكتب اسمك", Icons.person_outline),
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? "الرجاء إدخال الاسم" : null,
                    ),
                  ),

                  const SizedBox(height: 12),


                  _fieldCard(
                    child: TextFormField(
                      controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputStyle("البريد الإلكتروني", "example@mail.com", Icons.email_outlined),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return "الرجاء إدخال البريد الإلكتروني";
                        if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(v.trim())) return "البريد غير صالح";
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 12),


                  _fieldCard(
                    child: TextFormField(
                      controller: msgCtrl,
                      maxLines: 5,
                      decoration: _inputStyle("نص الرسالة", "اكتب رسالتك هنا...", Icons.message_outlined),
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? "الرجاء كتابة رسالة" : null,
                    ),
                  ),

                  const SizedBox(height: 18),


                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _onSendPressed,
                      child: const Text("إرسال الرسالة", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }


  InputDecoration _inputStyle(String label, String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: mainColor),
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: mainColor, width: 1.4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: mainColor, width: 1.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: mainColor, width: 2),
      ),
    );
  }


  Widget _fieldCard({required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }


  void _onSendPressed() {
    if (_formKey.currentState?.validate() != true) return;

    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("تم إرسال رسالتك، $name! سنتواصل معك عبر $email."),
        backgroundColor: Colors.green.shade700,
      ),
    );

    nameCtrl.clear();
    emailCtrl.clear();
    msgCtrl.clear();
  }


  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [


            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.support_agent, size: 30, color: mainColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("طرق التواصل", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text("اختر الحساب للعرض", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [

                  _drawerAccountItem(Icons.camera_alt, "Instagram", "@my_instagram", "@flow_stor123"),
                  _drawerAccountItem(Icons.alternate_email, "Twitter", "@my_twitter", "@flow_stor123"),
                  _drawerAccountItem(Icons.snapchat, "Snapchat", "my_snap", "@flow_stor123"),
                  _drawerAccountItem(Icons.music_note, "TikTok", "@my_tiktok", "@flow_stor123"),
                  _drawerAccountItem(Icons.email_outlined, "Email", "الايميل", "flow_stor123@gmail.com"),
                  _drawerAccountItem(Icons.phone_outlined, "اتصال", "رقم التواصل ", "772403779"),

                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _drawerAccountItem(IconData icon, String title, String account, String contact) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black87),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(account),
          const SizedBox(height: 4),
          Text(contact, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      isThreeLine: true,
      onTap: () => Navigator.pop(context),
    );
  }
}
