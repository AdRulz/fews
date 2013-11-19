FactoryGirl.define do
  factory :vote do
    article { create :article }
  end
end
