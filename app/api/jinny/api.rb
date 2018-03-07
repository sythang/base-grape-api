module Jinny
  class API < Grape::API
    format :json
    prefix :api

    mount Jinny::ApiV1
  end
end