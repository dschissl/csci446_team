class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.decimal :age, precision: 8, scale: 2
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
