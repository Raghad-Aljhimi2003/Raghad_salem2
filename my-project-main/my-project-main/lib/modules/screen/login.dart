import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';
import 'register.dart';
import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _toggle() => setState(() => _obscure = !_obscure);


  Future<void> _login() async {
    if (_emailCtrl.text.isEmpty || _passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('أكمل الحقول')),
      );
      return;
    }

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => _loading = false);


    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedUser = prefs.getString('username');
    final savedPass = prefs.getString('password');

    final enteredInput = _emailCtrl.text.trim().toLowerCase();
    final enteredPass = _passCtrl.text.trim();


    final bool emailMatch = enteredInput == savedEmail;
    final bool userMatch = enteredInput == savedUser?.toLowerCase();
    final bool passMatch = enteredPass == savedPass;

    if ((emailMatch || userMatch) && passMatch) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('بيانات الدخول غير صحيحة')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cardWidth = w * 0.88;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: cardWidth,
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
                      Center(
                        child: Column(
                          children: [
                            Image.asset('assets/images/image.png',
                                height: 72, fit: BoxFit.contain),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),

                      const SizedBox(height: 6),
                      const Center(
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 18),

                      TextField(
                        controller: _emailCtrl,
                        decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني أو اسم المستخدم',
                          filled: true,
                          fillColor: const Color(0xFFF6F6F6),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: _passCtrl,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          labelText: 'كلمة السر',
                          filled: true,
                          fillColor: const Color(0xFFF6F6F6),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _obscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: _toggle,
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _loading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB36A31),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 3,
                          ),
                          child: _loading
                              ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ))
                              : const Text(
                            'الدخول',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('ليس لديك حساب ؟'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterPage()),
                              );
                            },
                            child: const Text(
                              'أنشئ حساب جديد',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}