# frozen_string_literal: true

class Image < ApplicationRecord
  has_one_attached :file
  validates :file, presence:true
  validate :correct_file_type

  private

  def correct_file_type
    if self.file.content_type !~ (%r{^image/(jpeg|pjpeg|png|bmp)$})
      errors.add(:file, "is not the right type")
      return false
    end
  end
end
