class Post < ApplicationRecord
    DRINKING_HIGH = 3
    DRINKING_MIDDLE = 2
    DRINKING_LOW = 1

    belongs_to :user

    validates :drinking_status, presence: true, inclusion: {in: [DRINKING_HIGH, DRINKING_MIDDLE, DRINKING_LOW]}
    validate :expiration_datetime_cannot_be_in_the_past
    
    def expiration_datetime_cannot_be_in_the_past
      time = Time.now
      if datetime < Time.new(time.year, time.month, time.day, time.hour, 0, 0) + 1.hour
        errors.add(:datetime, "Can't be in the past")
      end
    end
end
