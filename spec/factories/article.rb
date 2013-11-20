FactoryGirl.define do
  factory :article do
    title 'Title'
    body 'Body'
    user { create :user }
  end
end
