class ConsideredItem < ActiveRecord::Base
	belongs_to :pet
	belongs_to :consideration
end
