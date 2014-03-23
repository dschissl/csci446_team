class Adoption < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def adoptPet
		puts line_items[0].pet.status
		line_items[0].pet.status = Pet::STATUSES[1]
		line_items[0].pet.save
	end
end
