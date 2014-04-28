class Offer < ActiveRecord::Base
	STATUSES = ["Pending", "Accepted", "Declined"]

	belongs_to :user
	
	has_many :line_items, dependent: :destroy

	#validates :item_id, :presence => { :message => "should exist" }
	validates :status, inclusion: STATUSES

	default_scope { where user_id: UserSession.current_user.id }
  scope :accepted, -> { where state: "Accepted" }
  scope :declined, -> { where state: "Declined" }
end
