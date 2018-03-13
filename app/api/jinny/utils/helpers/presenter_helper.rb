module Jinny::Utils::Helpers
  module PresenterHelper
    extend ActiveSupport::Concern
    included do
      after do
        present :status, :OK
      end
    end
  end
end