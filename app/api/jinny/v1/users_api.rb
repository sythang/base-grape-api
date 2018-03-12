module Jinny::V1
  class UsersAPI < Grape::API
    resources :users do
      desc 'Sign in' 
      params do
        requires :email, type: String
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

    # resource :statuses do
    #   desc 'Return a public timeline.'
    #   get :public_timeline do
    #     Status.limit(20)
    #   end

    #   desc 'Return a personal timeline.'
    #   get :home_timeline do
    #     authenticate!
    #     current_user.statuses.limit(20)
    #   end

    #   desc 'Return a status.'
    #   params do
    #     requires :id, type: Integer, desc: 'Status id.'
    #   end
    #   route_param :id do
    #     get do
    #       Status.find(params[:id])
    #     end
    #   end

    #   desc 'Create a status.'
    #   params do
    #     requires :status, type: String, desc: 'Your status.'
    #   end
    #   post do
    #     authenticate!
    #     Status.create!({
    #       user: current_user,
    #       text: params[:status]
    #     })
    #   end

    #   desc 'Update a status.'
    #   params do
    #     requires :id, type: String, desc: 'Status ID.'
    #     requires :status, type: String, desc: 'Your status.'
    #   end
    #   put ':id' do
    #     authenticate!
    #     current_user.statuses.find(params[:id]).update({
    #       user: current_user,
    #       text: params[:status]
    #     })
    #   end

    #   desc 'Delete a status.'
    #   params do
    #     requires :id, type: String, desc: 'Status ID.'
    #   end
    #   delete ':id' do
    #     authenticate!
    #     current_user.statuses.find(params[:id]).destroy
    #   end
    # end
  end
end