class validation_field{

   String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateAlphanumericPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    if (value.length < 6 || value.length > 12) {
      return 'Value must be between 6 and 12 characters';
    }
    final alphanumericRegex = RegExp("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#\$%^&*])[A-Za-z\\d!@#\$%^&*]{8,16}\$");
    if (!alphanumericRegex.hasMatch(value)) {
      return 'Value must be alphanumeric';
    }
    return null;
  }
}