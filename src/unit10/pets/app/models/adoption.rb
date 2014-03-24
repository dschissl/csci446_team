class Adoption < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def adoptPet
		if line_items.length > 0
			line_items[0].pet.status = Pet::STATUSES[1]
			line_items[0].pet.save
		end
	end
end
