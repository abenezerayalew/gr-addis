/// Custom exception class to handle various Firebase authentication-related errors.
class GFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.

  GFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';

      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';

      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The recipient email is invalid. Please verify the recipient\'s email.';
      case 'invalid-recipient':
        return 'The recipient is invalid. Please verify the recipient\'s email.';
      case 'invalid-continue-uri':
        return 'The continue URL provided is invalid.';
      case 'missing-continue-uri':
        return 'The continue URL is missing. Please provide a valid continue URL.';
      case 'missing-iframe-start':
        return 'An internal error has occurred. Please try again later.';
      case 'missing-iframe-end':
        return 'An internal error has occurred. Please try again later.';
      case 'missing-ios-bundle-id':
        return 'The iOS bundle ID is missing. Please provide a valid iOS bundle ID.';
      case 'missing-android-pkg-name':
        return 'The Android package name is missing. Please provide a valid Android package name.';
      case 'unauthorized-continue-uri':
        return 'The domain of the continue URL is not whitelisted. Please whitelist the domain in the Firebase Console.';
      case 'invalid-dynamic-link-domain':
        return 'The dynamic link domain provided is not configured or authorized for the current project.';
      case 'invalid-oauth-provider':
        return 'The OAuth provider ID is invalid. Please check the provider ID.';
      case 'invalid-oauth-client-id':
        return 'The OAuth client ID is invalid. Please check the client ID.';
      case 'invalid-cert-hash':
        return 'The SHA-1 certificate hash is invalid.';

      case 'invalid-provider-id':
        return 'The provider ID is invalid. Please check the provider ID.';

      case 'invalid-tenant-id':
        return 'The Auth instance\'s tenant ID is invalid.';

      case 'missing-credential':
        return 'The supplied credential is missing. Please provide a valid credential.';
      case 'missing-oauth-client-id':
        return 'The OAuth client ID is missing. Please check the client ID.';
      case 'missing-verification-id':
        return 'The phone auth credential was created with an empty verification ID.';
      case 'missing-verification-code':
        return 'The phone auth credential was created with an empty verification code.';
      case 'missing-tenant-id':
        return 'The Auth instance\'s tenant ID is missing.';
      case 'missing-multi-factor-info':
        return 'No second factor identifier is provided.';
      case 'missing-multi-factor-session':
        return 'No second factor session identifier is provided.';
      case 'missing-phone-number':
        return 'To send verification codes, provide a phone number for the recipient.';

      case 'timeout':
        return 'The network request timed out.';
      case 'captcha-check-failed':
        return 'The captcha check failed.';

      case 'play-services-unavailable':
        return 'Google Play services are unavailable.';
      case 'unauthorized-action':
        return 'This operation is not authorized. You might have recently signed in using another method.';
      case 'network-request-failed':
        return 'There was a network error (e.g., timeout, interrupted connection or unreachable host)';
      case 'insufficient-permission':
        return 'The app does not have sufficient permissions to perform this operation.';
      default:
        return 'An unknown error occurred.';
    }
  }
}
