# frozen_string_literal: true

class Image < ApplicationRecord
  has_many_attached :files
end
