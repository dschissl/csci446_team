class Offer < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	#validates :item_id, :presence => { :message => "should exist" }
end
