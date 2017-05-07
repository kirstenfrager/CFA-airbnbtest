FactoryGirl.define do
  factory :room do
    title "room title"
    description "description about room"
    user { create(:user) }
  end
end
