class CreateCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :counts do |t|
      t.integer :listeners
      t.integer :user_id

      t.timestamps
    end
  end
end
