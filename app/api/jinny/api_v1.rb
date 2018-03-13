module Jinny
  class ApiV1 < Grape::API
    version 'v1', using: :path, vendor: 'jinny'
    include Jinny::Utils::ErrorException
    include Jinny::Utils::Helpers::PresenterHelper
    helpers Jinny::Utils::Helpers::AuthenticatorHelper
    
    

    mount Jinny::V1::SessionsAPI
    mount Jinny::V1::UsersAPI
    mount Jinny::V1::MerchantsAPI

    #always response status OK if call api success
  end
end