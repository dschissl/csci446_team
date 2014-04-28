class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :message
      t.integer :item_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end
  end
end
