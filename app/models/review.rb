class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :content, presence: true

  has_many :comments, dependent: :destroy
end
