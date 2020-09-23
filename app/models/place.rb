class Place < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :items
end
