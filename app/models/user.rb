class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, ->{where role: "normal"}

  has_many :active_relationships, class_name:  "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name:  "Relationship",
    foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :reviews, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  has_many :favourites, dependent: :destroy
  has_many :books, through: :favourites

  has_many :read_states, dependent: :destroy
 
  has_many :requests, dependent: :destroy
  
  def has_favourite? book
    favourites.find_by_book_id book.id
  end

  def create_favourite book
    favourites.create book_id: book.id
  end

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end                                  
end
