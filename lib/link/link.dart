import 'package:url_launcher/url_launcher.dart';

class Link {
      // Función para abrir un enlace en el navegador
  static Future<void> LaunchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('No se pudo abrir el enlace: $urlString');
    }
  }
}