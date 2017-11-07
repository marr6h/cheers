class Entry < ApplicationRecord
    validates :post_id, :entry_from, presence: true
end
