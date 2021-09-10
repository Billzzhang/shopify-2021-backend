# frozen_string_literal: true

class Image < ApplicationRecord
  has_many_attached :files
  validate :correct_file_type

  private

  def correct_file_type
    self.files.each do |file|
      if file.content_type !~ (%r{^image/(jpeg|pjpeg|gif|png|bmp)$})
        errors.add(:file, "is not the right type")
        return false
      end
    end
  end
end
