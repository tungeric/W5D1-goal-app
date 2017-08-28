class UpdateGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :title, :string, null: false
    add_index :goals, :user_id
  end
end
