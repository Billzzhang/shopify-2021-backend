# frozen_string_literal: true

class Image < ApplicationRecord
  has_many_attached :files
  validates :files, presence:true
  validate :correct_file_type

  private

  def correct_file_type
    self.files.each do |file|
      if file.content_type !~ (%r{^image/(jpeg|pjpeg|png|bmp)$})
        errors.add(:file, "is not the right type")
        return false
      end
    end
  end
end
