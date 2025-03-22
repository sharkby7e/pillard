class CreateDosings < ActiveRecord::Migration[8.0]
  def change
    create_table :dosings do |t|
      t.timestamps
    end
  end
end
