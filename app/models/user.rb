class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                    foreign_key: "follower_id",
                    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                    foreign_key: "followed_id",
                    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, AvatarUploader

  SEARCH_LIMIT = 10

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def is_post?
      if (posts.nil? || posts.last.nil?)
          return false
      end
      t = Time.current
      if t.hour < 6
          t = t - 1.day
      end
      return !(posts.last.datetime.utc < t.beginning_of_day.utc)
  end

  def latest_post
      posts.last
  end

end
