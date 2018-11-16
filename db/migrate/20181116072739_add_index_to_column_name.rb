class AddIndexToColumnName < ActiveRecord::Migration[5.0]
  def change
   change_table :counts do |t|
      t.index :user_id, unique: true
    end
  end
end
