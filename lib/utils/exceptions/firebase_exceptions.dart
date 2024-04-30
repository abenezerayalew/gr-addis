//Custom exception class to handle various Firebase-related errors.
class GFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  GFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';

      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';
      case 'internal-error':
        return 'An internal Authentication error occurred. Please try again later.';
      case 'invalid-app-credential':
        return 'The app credential is invalid. Please check the app credential and try again.';

      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed-in user.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.';
      case 'auth-domain-config-required':
      case 'invalid-user-token':
        return 'The user\'s token is invalid. Please sign in again.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';
      case 'invalid-api-key':
        return 'The provided API key is invalid. Please check your API key.';

      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'operation-not-supported-in-this-environment':
        return 'This operation is not supported in the environment. Please try again.';
      case 'timeout':
        return 'The operation has timed out. Please try again.';
      case 'missing-android-pkg-name':
        return 'An Android Package Name must be provided if the Android App is required to be used.';
      case 'missing-continue-uri':
        return 'A valid continue URL must be provided in the request.';

      case 'missing-ios-bundle-id':
        return 'An iOS Bundle ID must be provided if an App Store ID is provided.';
      case 'missing-or-invalid-nonce':
        return 'The nonce is missing or invalid. Please check your nonce.';
      case 'missing-phone-number':
        return 'To send verification codes, provide a phone number for the recipient.';
      case 'missing-verification-id':
        return 'The phone auth credential was created with an empty verification ID.';
      case 'app-deleted':
        return 'The App instance has been deleted from the project.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'no-auth-event':
        return 'An internal error has occurred. Please try again.';
      case 'no-such-provider':
        return 'User was not linked to an account with the given provider.';

      case 'missing-app-credential':
        return 'The app credential is missing. Please provide valid app credentials.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';

      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.';

      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'credential already-in-use':
        return 'This credential is already associated with a different user account.';

      default:
        return 'An unknown error occurred.';
    }
  }
}
