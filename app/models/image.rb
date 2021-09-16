# frozen_string_literal: true

# Model class for images
class Image < ApplicationRecord
  has_one_attached :file
  validates :file, presence: true
  validate :correct_file_type

  private

  def correct_file_type
    errors.add(:file, 'is not the right type') unless file.content_type&.match?(%r{^image/(jpeg|pjpeg|png|bmp)$})
  end
end
