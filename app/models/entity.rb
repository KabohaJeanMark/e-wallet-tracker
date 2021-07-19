class Entity < ApplicationRecord
  validates :name, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group
end
