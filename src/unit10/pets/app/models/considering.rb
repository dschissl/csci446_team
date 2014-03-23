class Considering < ActiveRecord::Base
	has_many :considered_items, dependent: :destroy
end
