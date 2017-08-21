class Post < ApplicationRecord
    DRINKING_HIGH = 3
    DRINKING_MIDDLE = 2
    DRINKING_LOW = 1

    belongs_to :user

    validates :drinking_status, presence: true, inclusion: {in: [DRINKING_HIGH, DRINKING_MIDDLE, DRINKING_LOW]}
end
