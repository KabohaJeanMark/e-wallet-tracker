class Entity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :author, class_name: 'User'
  belongs_to :group
end
