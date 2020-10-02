class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places
  has_many :items

  validates :nickname, presence: true
  validates :email, format: { with: %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z} }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = 'ccc111'
    end
  end
end
