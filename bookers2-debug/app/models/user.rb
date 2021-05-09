class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # has_many :relationships
  # has_many :followings, through: :relationships, source: :followed
  # has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  # has_many :followers, through: :reverse_of_relationships, source: :follower

  # has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  # has_many :passive_relationships,class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  # has_many :following, through: :active_relationships, source: :followed
  # has_many :followers, through: :passive_relationships, source: :follower


  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed




  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(followed_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   relationship = self.relationships.find_by(followed_id: other_user.id)
  #   relationship.destroy if relationship
  # end

  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end


  # # ユーザーをフォローする
  # def follow(other_user)
  #   # following << other_user
  #   active_relationships.create(followed_id: other_user.id)
  # end

  # # ユーザーをアンフォローする
  # def unfollow(other_user)
  #   active_relationships.find_by(followed_id: other_user.id).destroy
  # end

  # # 現在のユーザーがフォローしてたらtrueを返す
  # def following?(other_user)
  #   following.include?(other_user)
  # end


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end





  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end

  # belongs_to :books
  # attachment :profile_image, destroy: false
  attachment :profile_image
  validates :name, length: { in: 2..20}, uniqueness: true, presence: true
  validates :introduction, length: { maximum: 50 }

end
