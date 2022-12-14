class Performance < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :group

  validates :name, presence: true, length: { maximum: 25 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
