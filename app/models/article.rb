class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :category, :title, :content, :user, presence: true
  validates :title, uniqueness: true
end
