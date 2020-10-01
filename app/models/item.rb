class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :place

  with_options presence: true do
    validates :name
    validates :image
    validates :store
  end

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
