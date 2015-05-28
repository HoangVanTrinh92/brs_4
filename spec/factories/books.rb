FactoryGirl.define do
  factory :book do
    title "sach1"
    author "abc"
    number_page "123"
  end

  factory :invalid_book, parent: :book do |b|
    b.title nil
  end
end