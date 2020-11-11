class SessionGroup < ApplicationRecord
  before_create :init
  after_create :create_shared_image
  has_one :shared_image

  #7fffffffffffffff in Hex
  MAX_RANDOM_INT = 9223372036854775807

  protected

  def init
    begin
      self.slug = generate_slug
    end while self.class.exists?(slug: slug)
  end

  def create_shared_image
    SharedImage.create!(session_group_id: self.id)
  end

  def generate_slug
    rand(MAX_RANDOM_INT).to_s(32)
  end
end
