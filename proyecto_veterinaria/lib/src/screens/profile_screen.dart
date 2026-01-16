import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data
    const String userName = 'María González';
    const String userEmail = 'maria.gonzalez@email.com';
    const String userPhone = '+52 123 456 7890';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile picture
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              userEmail,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 32),

            // Profile options
            _ProfileOption(
              icon: Icons.person_outline,
              title: 'Información Personal',
              subtitle: 'Actualiza tus datos',
              onTap: () {
                // TODO: Navigate to edit profile
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.phone_outlined,
              title: 'Teléfono',
              subtitle: userPhone,
              onTap: () {
                // TODO: Navigate to edit phone
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.email_outlined,
              title: 'Correo Electrónico',
              subtitle: userEmail,
              onTap: () {
                // TODO: Navigate to edit email
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.lock_outline,
              title: 'Cambiar Contraseña',
              subtitle: 'Actualiza tu contraseña',
              onTap: () {
                // TODO: Navigate to change password
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.notifications_outlined,
              title: 'Notificaciones',
              subtitle: 'Administra tus notificaciones',
              onTap: () {
                // TODO: Navigate to notifications settings
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.help_outline,
              title: 'Ayuda y Soporte',
              subtitle: 'Obtén ayuda',
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            const SizedBox(height: 12),
            _ProfileOption(
              icon: Icons.info_outline,
              title: 'Acerca de',
              subtitle: 'Versión 1.0.0',
              onTap: () {
                // TODO: Show about dialog
              },
            ),
            const SizedBox(height: 32),

            // Logout button
            OutlinedButton.icon(
              onPressed: () {
                _showLogoutDialog(context);
              },
              icon: const Icon(Icons.logout, color: AppTheme.errorColor),
              label: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: AppTheme.errorColor),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppTheme.errorColor),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppTheme.primaryColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppTheme.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
