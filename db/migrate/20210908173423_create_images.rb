# frozen_string_literal: true

# Create a table for images
class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images, &:timestamps
  end
end
