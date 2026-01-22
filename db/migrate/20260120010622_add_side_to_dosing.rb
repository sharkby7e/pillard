class AddSideToDosing < ActiveRecord::Migration[8.0]
  def change
    add_column :dosings, :side, :integer
  end
end
