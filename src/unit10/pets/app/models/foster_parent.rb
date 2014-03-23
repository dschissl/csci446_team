class FosterParent < ActiveRecord::Base
	belongs_to :pet, dependent: :destroy
	validates :name, :address, :email, presence: true
end
