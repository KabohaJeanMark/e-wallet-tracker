class Entity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1_000_000_000 }

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :most_recent, -> { order(created_at: :desc) }
  scope :most_ancient, -> { order(created_at: :asc) }
  scope :external, -> { where(group_id: nil) }
  scope :internal, -> { where.not(group_id: nil) }
end
