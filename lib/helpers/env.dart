import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField()
  @EnviedField(obfuscate: true)
  static String baseUrl = _Env.baseUrl;
  @EnviedField()
  static String apiToken = _Env.apiToken;
}
