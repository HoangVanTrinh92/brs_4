class ReadState < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  scope :latest, -> (user_id, book_id) {where(user_id: user_id, book_id: book_id).order('created_at DESC')}
end
