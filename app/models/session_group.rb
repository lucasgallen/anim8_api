class SessionGroup < ApplicationRecord
  before_create :init
  after_create :create_shared_image
  has_one :shared_image, dependent: :destroy

  #7fffffffffffffff in Hex
  MAX_RANDOM_INT     = 9223372036854775807
  MAX_IDLE           = 1.day
  CLEANUP_BATCH_SIZE = 300

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

  def self.cleanup_stale_sessions
    stale_sessions = where("image_updated_at < ?", MAX_IDLE.ago)
    stale_sessions.in_batches(of: CLEANUP_BATCH_SIZE).destroy_all
  end
end
