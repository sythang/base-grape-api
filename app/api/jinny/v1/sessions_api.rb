module Jinny::V1
  class SessionsAPI < Grape::API
    resource :sessions do
      desc 'Sign in'
      post do
        {status: :OK}
      end

      desc 'Sign out'
      delete ':id' do
        { status: :OK }
      end
    end
  end
end