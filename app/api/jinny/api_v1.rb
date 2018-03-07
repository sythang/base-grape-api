module Jinny
  class ApiV1 < Grape::API
    version 'v1', using: :path, vendor: 'jinny'

    mount Jinny::V1::SessionsAPI
  end
end