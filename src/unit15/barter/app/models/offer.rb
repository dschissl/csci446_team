class Offer < ActiveRecord::Base
	STATUSES = ["Pending", "Accepted", "Declined"]

	belongs_to :user
	
	has_many :line_items, dependent: :destroy

	#validates :item_id, :presence => { :message => "should exist" }
	validates :status, inclusion: STATUSES

	default_scope { where user_id: UserSession.current_user.id }
  scope :accepted, -> { where status: "Accepted" }
  scope :declined, -> { where status: "Declined" }
end
