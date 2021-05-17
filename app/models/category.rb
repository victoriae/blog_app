class Category < ApplicationRecord
  has_many :article, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
