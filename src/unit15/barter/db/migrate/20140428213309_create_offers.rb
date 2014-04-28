class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :message
      t.integer :item_id

      t.timestamps
    end
  end
end
