class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        attachment :profle_image
        validates :name, presence: true, length: { in: 2..10 }

        has_many :sites, dependent: :destroy
        has_many :likes, dependent: :destroy
end
