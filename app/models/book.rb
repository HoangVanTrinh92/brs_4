class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  
  has_many :favourites, dependent: :destroy
  has_many :users , through: :favourites
end
