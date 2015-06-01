FactoryGirl.define do
  factory :comment do
    user
    review
    content "comment1"
  end
end