class Entry < ApplicationRecord
    validates :post_id, presence: true

    def from_user
        User.where(id: self.entry_from).first
    end

end
