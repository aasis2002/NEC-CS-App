import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_providers.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final bool isGuest;
  final String? photoUrl;
  final String? college;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.isGuest = false,
    this.photoUrl,
    this.college,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    bool? isGuest,
    String? photoUrl,
    String? college,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isGuest: isGuest ?? this.isGuest,
      photoUrl: photoUrl ?? this.photoUrl,
      college: college ?? this.college,
    );
  }
}

class AuthNotifier extends StateNotifier<AppUser> {
  final Ref ref;

  AuthNotifier(this.ref)
      : super(const AppUser(
          id: 'local_guest_user',
          name: 'Guest Engineer',
          email: 'guest@nec-cs.local',
          isGuest: true,
        )) {
    _loadSavedUser();
  }

  Future<void> _loadSavedUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedId = prefs.getString('auth_user_id');
      final savedName = prefs.getString('auth_user_name');
      final savedEmail = prefs.getString('auth_user_email');
      final isGuest = prefs.getBool('auth_is_guest') ?? true;

      if (savedId != null && !isGuest && savedEmail != null) {
        final user = AppUser(
          id: savedId,
          name: savedName ?? 'NEC CS Engineer',
          email: savedEmail,
          isGuest: false,
        );
        state = user;
        ref.read(currentUserIdProvider.notifier).state = user.id;
      }
    } catch (_) {}
  }

  Future<bool> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600)); // Smooth UX transition
    final trimmed = email.trim();
    final name = trimmed.split('@').first;
    final user = AppUser(
      id: 'user_${trimmed.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}',
      name: name.isNotEmpty ? '${name[0].toUpperCase()}${name.substring(1)}' : 'Engineer',
      email: trimmed,
      isGuest: false,
    );

    state = user;
    ref.read(currentUserIdProvider.notifier).state = user.id;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_user_id', user.id);
    await prefs.setString('auth_user_name', user.name);
    await prefs.setString('auth_user_email', user.email);
    await prefs.setBool('auth_is_guest', false);

    return true;
  }

  Future<bool> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? college,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final trimmed = email.trim();
    final user = AppUser(
      id: 'user_${trimmed.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}',
      name: name.trim().isNotEmpty ? name.trim() : 'Engineer',
      email: trimmed,
      college: college?.trim(),
      isGuest: false,
    );

    state = user;
    ref.read(currentUserIdProvider.notifier).state = user.id;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_user_id', user.id);
    await prefs.setString('auth_user_name', user.name);
    await prefs.setString('auth_user_email', user.email);
    await prefs.setBool('auth_is_guest', false);

    return true;
  }

  Future<bool> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 800));
    const user = AppUser(
      id: 'google_aashish_verified',
      name: 'Aashish Mehta',
      email: 'aasismehta100@gmail.com',
      isGuest: false,
      photoUrl: 'https://lh3.googleusercontent.com/a/default-user',
    );

    state = user;
    ref.read(currentUserIdProvider.notifier).state = user.id;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_user_id', user.id);
    await prefs.setString('auth_user_name', user.name);
    await prefs.setString('auth_user_email', user.email);
    await prefs.setBool('auth_is_guest', false);

    return true;
  }

  Future<bool> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<void> signOut() async {
    const guest = AppUser(
      id: 'local_guest_user',
      name: 'Guest Engineer',
      email: 'guest@nec-cs.local',
      isGuest: true,
    );
    state = guest;
    ref.read(currentUserIdProvider.notifier).state = guest.id;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('auth_is_guest', true);
  }
}

final authStateProvider = StateNotifierProvider<AuthNotifier, AppUser>((ref) {
  return AuthNotifier(ref);
});
