class AddDrinkingStatusToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :drinking_status, :integer
  end
end
