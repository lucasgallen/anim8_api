class ApiKey < ApplicationRecord
  before_create :init

  protected

  def init
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
