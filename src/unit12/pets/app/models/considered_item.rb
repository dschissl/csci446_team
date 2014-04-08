class ConsideredItem < ActiveRecord::Base
	# a considered item belongs to a pet and a consideration
	belongs_to :pet
	belongs_to :consideration
end
