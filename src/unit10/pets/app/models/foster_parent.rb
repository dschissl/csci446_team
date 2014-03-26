class FosterParent < ActiveRecord::Base
	#a foster parent belongs to a pet
	belongs_to :pet, dependent: :destroy
	#validation rules for foster parent, fields listed must be present
	validates :name, :address, :email, presence: true
end
