class Article < ApplicationRecord
  has_many :comment
  
  belongs_to :category
  belongs_to :user

  validates :category, :title, :content, :user, presence: true
  validates :title, uniqueness: true
end
