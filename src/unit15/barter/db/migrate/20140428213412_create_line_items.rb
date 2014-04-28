class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :offer_id
      t.timestamps
    end
  end
end
