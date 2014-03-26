class Consideration < ActiveRecord::Base
	# a consideration has many considered items
	has_many :considered_items, dependent: :destroy
end
