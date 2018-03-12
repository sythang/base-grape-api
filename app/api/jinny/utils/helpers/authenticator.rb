module Jinny::Utils::Helpers
  module Authenticator
    def current_user
      p "===="
      p headers
      raise Jinny::Utils::Errors::AuthenticationErrors::AccessTokenMissing.new unless headers['Jinny-Http-Token'] 
      api_token = ApiToken.find_by(token: headers['Jinny-Http-Token'])

      raise Jinny::Utils::Errors::AuthenticationErrors::AccessTokenIncorrect.new unless api_token
      raise Jinny::Utils::Errors::AuthenticationErrors::AuthTokenInvalid.new if api_token.expired?
      @current_user ||= api_token.user
    end

    def user_signed_in?
      current_user.present?
    end

    def authenticate_user!
      raise Jinny::Utils::Errors::AuthenticationErrors::AuthTokenInvalid unless user_signed_in?
    end

    def sign_in(email, password)
      user = User.find_by(email: email)
      p user
      raise Jinny::Utils::Errors::AuthenticationErrors::EmailNotFound.new unless user
      raise Jinny::Utils::Errors::AuthenticationErrors::WrongPassword.new unless user.valid_password?(password)
      api_token = user.generate_access_token
      user.token = api_token.token
      return user
    end
  end
end