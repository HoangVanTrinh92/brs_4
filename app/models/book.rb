class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  
  has_many :favourites, dependent: :destroy
  has_many :users , through: :favourites
  
  has_many :read_states, dependent: :destroy
end
