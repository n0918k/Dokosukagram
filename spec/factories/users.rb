FactoryBot.define do
  factory :user do
    nickname {'あああ'}
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
  end
end
