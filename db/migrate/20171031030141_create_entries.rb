class CreateEntries < ActiveRecord::Migration[5.0]
    def change
        create_table :entries do |t|
            t.integer :post_id
            t.integer :entry_to
            t.integer :entry_from
            t.integer :cheer
            t.timestamps
        end
    end
end
