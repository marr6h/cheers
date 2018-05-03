class Entry < ApplicationRecord
    validates :post_id, presence: true

    def from_user
        User.where(id: self.entry_from).first
    end

    def to_user
        User.where(id: self.entry_to).first
    end

end
