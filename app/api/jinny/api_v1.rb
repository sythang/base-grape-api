module Jinny
  class ApiV1 < Grape::API
    version 'v1', using: :path, vendor: 'jinny'
    include Jinny::Utils::ErrorException
    helpers Jinny::Utils::Helpers::Authenticator

    mount Jinny::V1::SessionsAPI
    mount Jinny::V1::UsersAPI
  end
end