class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Este e-mail já está em uso. Use outro ou faça login.',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida. Contate o suporte.',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Muitas tentativas. Tente novamente mais tarde.',
    'EMAIL_NOT_FOUND':
        'E-mail não encontrado. Verifique ou registre uma nova conta.',
    'INVALID_PASSWORD': 'Senha inválida. Verifique e tente novamente.',
    'USER_DISABLED': 'Conta desativada. Contate o suporte para ajuda.'
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação';
  }
}
