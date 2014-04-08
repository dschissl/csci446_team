class Adoption < ActiveRecord::Base
	#an adoption has many line items
	has_many :line_items, dependent: :destroy

	#updates status of line item for when pet is adopted
	def adoptPet
		if line_items.length > 0
			line_items[0].pet.status = Pet::STATUSES[1]
			line_items[0].pet.save
		end
	end
end
