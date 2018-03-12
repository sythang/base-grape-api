module Jinny::Utils
	module ErrorException
		extend ActiveSupport::Concern
		included do
			rescue_from Grape::Exceptions::ValidationErrors do |e|
				error!({error_message: e.message, code: "VALIDATION_ERROR"}, 200)
			end
			rescue_from ActiveRecord::RecordNotFound do |e|
				error!({ error_message: I18n.t('resource_not_found'), code: "RESOURCE_NOT_FOUND"}, 200)
			end

			rescue_from ActiveRecord::RecordInvalid do |e|
				error!({error_message: e.message, code: "RESOURCE_INVALID"}, 200)
			end

			rescue_from Jinny::Utils::Errors::BaseError do |e|
				error!({ error_message: e.error_message, code: e.error_code}, 200)
			end
		end
	end
end