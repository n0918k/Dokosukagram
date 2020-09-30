class Place < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :items, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :image
  end
end
