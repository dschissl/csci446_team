class Item < ActiveRecord::Base
	STATUSES = ["Avaliable", "Taken"]

	belongs_to :user
	mount_uploader :image, ImageUploader

	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :status, inclusion: STATUSES

	default_scope { where status: "Avaliable" }
  scope :mine, -> { where user_id: UserSession.current_user.id }
  scope :taken, -> { where status: "Taken" }

  def belongs_to_me?
		user.id == UserSession.current_user.id
	end

	private
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
