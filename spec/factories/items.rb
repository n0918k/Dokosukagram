FactoryBot.define do
  factory :item do
    association :user
    association :place

    name { 'あああ' }
    store { '3' }
  end
end
