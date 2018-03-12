module Admin
	class BaseController < ActionController::Base
		layout 'admin'
		before_action :authenticate_administrator!
	end
end