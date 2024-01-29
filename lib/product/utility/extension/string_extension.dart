extension StringExtension on String {

  String toSnakeCase() {
    return replaceAll(RegExp(r'[^\w\ğüşıöçĞÜŞİÖÇ]'), '_')
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[ğĞ]'), 'g')
        .replaceAll(RegExp(r'[üÜ]'), 'u')
        .replaceAll(RegExp(r'[şŞ]'), 's')
        .replaceAll(RegExp(r'[ıİ]'), 'i') 
        .replaceAll(RegExp(r'[öÖ]'), 'o') 
        .replaceAll(RegExp(r'[çÇ]'), 'c') 
        .toLowerCase();
  }
}
