class Pet < ActiveRecord::Base
	STATUSES = [ "Avaliable", "Fostered" ]

	has_many :line_items
	has_many :considered_items

	before_destroy :ensure_not_referenced_by_any_line_item
	before_destroy :ensure_not_referenced_by_any_considered_item

	validates :name, :age, :pet_type, :description, :image_url, presence: true
	validates :age, numericality: {greater_than_or_equal_to: 0}
	validates :image_url, allow_blank: true, format: { 
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	validates :status, inclusion: STATUSES

	private

    	# ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item 
			if line_items.empty?
				return true 
			else
				errors.add(:base, 'Line Items present')
				return false 
			end
		end

		# ensure that there are no considered items referencing this product
		def ensure_not_referenced_by_any_considered_item 
			if considered_items.empty?
				return true 
			else
				errors.add(:base, 'Consideraion Items present')
				return false 
			end
		end
end
