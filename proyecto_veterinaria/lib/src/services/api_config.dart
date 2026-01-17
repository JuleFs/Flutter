class ApiConfig {
  static const String baseUrl = 'http://localhost:3000';
  
  // Endpoints
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String myPets = '/mascotas/mias';
  static const String registerPet = '/mascotas';
  static const String myAppointments = '/citas/mias';
  static const String createAppointment = '/citas';
  static String updateAppointmentStatus(String id) => '/citas/$id';
}
