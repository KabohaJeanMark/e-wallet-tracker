class Group < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :entities
  has_one_attached :icon

  validates :icon, presence: true, content_type: { in: %w[image/jpeg image/gif image/png],
                                                   message: 'must be a valid image format' }
end
