class Post < ApplicationRecord
    DRINKING_HIGH = 3
    DRINKING_MIDDLE = 2
    DRINKING_LOW = 1

    belongs_to :user

    validate :expiration_datetime_cannot_be_in_the_past

    scope :latest, -> do
        post_hash = Post.group(:user_id).maximum(:id)
        posts = post_hash.values
        where(id: posts)
    end

    def expiration_datetime_cannot_be_in_the_past
      time = Time.now
      if datetime.nil?
        errors.add(:datetime, "Datetime can not be blank")
        return
      end
      if datetime < Time.new(time.year, time.month, time.day, time.hour, 0, 0) + 1.hour
        errors.add(:datetime, "Can't be in the past")
      end
    end

    def hour
        return datetime.hour.to_s unless datetime.nil?
    end

end
