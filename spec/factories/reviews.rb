FactoryGirl.define do
  factory :review do
    user
    book
    content "review1"
  end
end