class Error
  class << self; attr_accessor :code, :message; end
  def code
    @code ||= "Hello"
  end
  private
    def self.code(error_code)
      @code ||= error_code
    end
end