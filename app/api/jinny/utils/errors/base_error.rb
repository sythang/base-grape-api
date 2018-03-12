module Jinny::Utils::Errors
  class BaseError < StandardError
    class << self; attr_accessor :error_code, :error_message; end
    attr_accessor :error_message

    def error_code
      self.class.error_code
    end

    def error_message
      @error_message || self.class.error_message
    end

  private
    def self.code(code)
      @error_code ||= code
    end

    def self.message(message)
      @error_message ||= message
    end
  end
end
