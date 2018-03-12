module Jinny::V1
  class UsersAPI < Grape::API
    resources :users do
      desc 'User sign up' do
      end
      params do
        requires :email, type: String, regexp: /.+@.+/
        requires :password
      end
      post :sign_up do
        user = User.find_by(email: params[:email])
        raise Jinny::Utils::Errors::AuthenticationErrors::EmailAlreadyTaken.new if user.present?

        user = User.create!(declared(params))
        api_token = user.generate_access_token
        user.token = api_token.token
        present :status, :OK
        present :result, user, with: Jinny::Entities::User, with_token: true
      end
    end
  end
end