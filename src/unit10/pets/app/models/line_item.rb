class LineItem < ActiveRecord::Base
	#a lineitem belongs to a particular pet and a particular adoption object
	belongs_to :pet
	belongs_to :adoption
end
