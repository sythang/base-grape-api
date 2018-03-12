module Jinny::V1
  class SessionsAPI < Grape::API
    resource :sessions do
      desc 'Sign in' do
        failure [[200, 'Unauthorized']]
      end
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post :sign_in do
        user = sign_in(params[:email], params[:password])
        present :status, :OK
        present :result, user, with: Jinny::Entities::User, with_token: true
      end

      before do
        authenticate_user!
      end
      desc 'Sign out'
      delete :sign_out do
        api_token = ApiToken.find_by(token: headers['Jinny-Http-Token'])
        api_token.expires!
        present :status, :OK
      end
    end
  end
end