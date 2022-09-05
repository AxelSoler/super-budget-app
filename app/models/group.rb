class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :performance
  
  validates :name, presence: true, length: { maximum: 25 }
  validates :icon, presence: true, length: { maximum: 200 }
end
