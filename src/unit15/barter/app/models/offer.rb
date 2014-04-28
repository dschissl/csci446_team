class Offer < ActiveRecord::Base
	belongs_to :user
	
	has_many :line_items, dependent: :destroy

	#validates :item_id, :presence => { :message => "should exist" }
end
