module Jinny::Entities
  class User < Grape::Entity
    format_with :date do |date|
      data.strftime("%d/%M/%Y") if date
    end
    expose :email
    expose :full_name
    expose :dob, format_with: :date
    expose :gender
    expose :token, if: lambda { |instance, options| options[:with_token] == true }
  end
end