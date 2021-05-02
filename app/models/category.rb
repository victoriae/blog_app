class Category < ApplicationRecord
  has_many :article

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
