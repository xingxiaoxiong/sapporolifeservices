class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.integer :rent
      t.string :link

      t.timestamps
    end
  end
end
