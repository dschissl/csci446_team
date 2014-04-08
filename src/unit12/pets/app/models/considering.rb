class Considering < ActiveRecord::Base
	#a considering object has many considered_items
	has_many :considered_items, dependent: :destroy
end
