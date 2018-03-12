module Jinny::Utils::Helpers
  module Default
    def render_error(message, code="UNKNOWN")
      error!({error_message: message, code: code},200)
    end
  end
end