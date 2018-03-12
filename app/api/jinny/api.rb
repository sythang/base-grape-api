module Jinny
  class API < Grape::API
    format :json
    prefix :api

    mount Jinny::ApiV1
    add_swagger_documentation
  end
end