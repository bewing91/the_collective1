class Project < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	mount_uploader :media, MediaUploader

	validates :user_id, presence: true
	validates :description, presence: true
	validates :name, presence: true, length: { maximum: 50 }
	validate :media_size

	private

		def media_size
			if media.size > 50.megabytes
				errors.add(:media, "should be less than 50 MB")
			end
		end
end
