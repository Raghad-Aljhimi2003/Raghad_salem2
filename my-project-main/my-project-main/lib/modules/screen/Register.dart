
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _toggleObscure() => setState(() => _obscure = !_obscure);


  bool _hasUppercase(String s) => s.contains(RegExp(r'[A-Z]'));


  bool _hasSymbol(String s) => s.contains(RegExp(r'[^A-Za-z0-9]'));


  Future<void> _register() async {
    final user = _userCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text;
    final passTrimmed = pass.trim();

    if (user.isEmpty || email.isEmpty || passTrimmed.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('اكمل جميع الحقول'))
      );
      return;
    }


    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('البريد الإلكتروني غير صالح: يجب أن يحتوي @'))
      );
      return;
    }


    if (passTrimmed.length <= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمة المرور يجب أن تكون أكثر من 8 أحرف'))
      );
      return;
    }
    if (!passTrimmed.contains(RegExp(r'[A-Z]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل'))
      );
      return;
    }
    if (!passTrimmed.contains(RegExp(r'[^A-Za-z0-9]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمة المرور يجب أن تحتوي على رمز واحد على الأقل (مثل ! @ # \$ %)'))
      );
      return;
    }

    setState(() => _loading = true);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', true);
    await prefs.setString('username', user);
    await prefs.setString('email', email.toLowerCase());
    await prefs.setString('password', passTrimmed);
    setState(() => _loading = false);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم التسجيل بنجاح')));
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final cardWidth = w * 0.86;

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFF2),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Container(
              width: cardWidth,
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // logo
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/image.png', height: 72, fit: BoxFit.contain),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),

                  const SizedBox(height: 6),
                  const Center(
                    child: Text('تسجيل حساب جديد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(height: 16),

                  // Username
                  TextField(
                    controller: _userCtrl,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Email
                  TextField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'حساب الإيميل',
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Password
                  TextField(
                    controller: _passCtrl,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: 'كلمة السر',
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: _toggleObscure,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Register button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB36A31),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 3,
                      ),
                      child: _loading
                          ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : const Text('التسجيل', style: TextStyle(fontSize: 16)),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Google sign


                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('لديك حساب؟'),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('تسجيل الدخول'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
