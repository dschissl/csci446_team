class CreateConsideredItems < ActiveRecord::Migration
  def change
    create_table :considered_items do |t|
      t.integer :pet_id
      t.integer :consideration_id

      t.timestamps
    end
  end
end
