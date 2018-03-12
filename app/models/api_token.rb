class ApiToken < ApplicationRecord
  belongs_to :user
  before_create :generate_access_token
  def expired?
    return false unless expired_at
    DateTime.now >= self.expired_at
  end

  def expires
    self.expired_at = Time.now
  end
  def expires!
    expires && save
  end
  private
    def generate_access_token
      begin
        self.token = SecureRandom.hex
      end while self.class.exists?(token: token)
    end
end
