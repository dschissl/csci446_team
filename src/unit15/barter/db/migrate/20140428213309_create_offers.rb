class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :message

      t.timestamps
    end
  end
end
