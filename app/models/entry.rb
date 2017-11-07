class Entry < ApplicationRecord
    validates :post_id, :entry_from, presence: true

    def from_user
        User.find(entry_from)
    end
end
