class Offer < ActiveRecord::Base
	STATUSES = ["Pending", "Accepted", "Declined"]

	belongs_to :user
	belongs_to :item
	
	has_many :line_items, dependent: :destroy
	has_many :items, through: :line_items

	#validates :item_id, :presence => { :message => "should exist" }
	validates :status, inclusion: STATUSES

	uncached do
		scope :sent, -> { where("user_id = " + UserSession.current_user.id.to_s) }
	  scope :recieved, -> { where("to_user_id = " + UserSession.current_user.id.to_s) }
	  #scope :accepted, -> { where status: "Accepted" }
	  #scope :declined, -> { where status: "Declined" }
	end

  def belongs_to_me?
		user.id == UserSession.current_user.id
	end
end
