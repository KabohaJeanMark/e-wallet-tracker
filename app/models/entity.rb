class Entity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :most_recent, -> { order(created_at: :desc) }
  scope :most_ancient, -> { order(created_at: :asc) }
end
