import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/theme/app_theme.dart';

class SetupNameScreen extends StatefulWidget {
  const SetupNameScreen({super.key});

  @override
  State<SetupNameScreen> createState() => _SetupNameScreenState();
}

class _SetupNameScreenState extends State<SetupNameScreen> {
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveName() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введите имя')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      // userChanges() stream fires automatically → AuthGate rebuilds → MainPage
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: ${e.message}')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.screenHorizontalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_outline_rounded,
                  size: 72,
                  color: colors.primary,
                ),
                SizedBox(height: spacing.gapXL),
                Text(
                  'Как вас зовут?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: spacing.gapM),
                Text(
                  'Введите имя, которое будет\nотображаться в приложении',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: spacing.gapXL),
                TextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  onSubmitted: (_) => _saveName(),
                  decoration: AppTheme.authInputDecoration(
                    context,
                    hintText: 'Например: Матвей',
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      color: colors.onSurfaceVariant.withValues(alpha: 0.65),
                    ),
                  ),
                ),
                SizedBox(height: spacing.gapXL),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _saveName,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Продолжить'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
