class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true, lenght: { maximum: 160 }
end
