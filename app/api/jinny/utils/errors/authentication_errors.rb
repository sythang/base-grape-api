module Jinny::Utils::Errors
  module AuthenticationErrors
    class AccessTokenMissing < BaseError
      code "ACCESS_TOKEN_MISSING"
      message "Access token not provided"
    end

    class AccessTokenIncorrect < BaseError
      code "ACCESS_TOKEN_INCORRECT"
      message "Access token invalid"
    end

    class EmailNotFound < BaseError
      code "EMAIL_NOT_FOUND"
      message "Email not found"
    end

    class EmailAlreadyTaken < BaseError
      code "EMAIL_ALREADY_TAKEN"
      message "Email already taken"
    end

    class WrongPassword < BaseError
      code "WRONG_PASSWORD"
      message "Wrong password"
    end

    class IncorrectPassword < BaseError
      code "INCORRECT_PASSWORD"
      message "Your new password incorrect!"
    end

    class AuthTokenInvalid < BaseError
      code "AUTH_TOKEN_INVALID"
      message "OAuth token invalid or expired"
    end

    class EmailNotConfirm < BaseError
      code 1011
      message "Email is not confirm"
    end

    class AccountNotActive < BaseError
      code 1012
      message "This account has not been activated yet"
    end
  end
end
