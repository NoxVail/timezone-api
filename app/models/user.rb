class User < ApplicationRecord
  VALID_EMAIL = /\A[^@\s]+@[^@\s]+\z/

  after_save :flush_cache!

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :token, presence: true, uniqueness: true

  private

  def flush_cache!
    Rails.cache.delete(email)
  end
end
