class Consideration < ActiveRecord::Base
	has_many :considered_items, dependent: :destroy
end
