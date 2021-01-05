class Site < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy

    def liked_by?(user)
  		likes.where(user_id: user.id).exists?
	end

    validates :site_name, presence: true, length:{in: 1..15}
	validates :discription, presence: true, length: {in: 2..200}
	validates :site_url, presence: true
end
