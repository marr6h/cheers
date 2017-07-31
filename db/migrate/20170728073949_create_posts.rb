class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.datetime :datetime
      t.string :location
      t.string :remarks

      t.timestamps
    end
  end
end
