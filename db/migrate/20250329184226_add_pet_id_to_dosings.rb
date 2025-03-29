class AddPetIdToDosings < ActiveRecord::Migration[8.0]
  def change
    add_column :dosings, :pet_id, :integer, null: false
  end
end
