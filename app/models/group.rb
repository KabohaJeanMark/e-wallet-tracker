class Group < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :entities
  has_one_attached :icon
end
