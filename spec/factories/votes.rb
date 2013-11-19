FactoryGirl.define do
  factory :vote do
    user { create :user }
    article { create :article }
  end
end
