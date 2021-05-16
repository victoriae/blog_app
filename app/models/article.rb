class Article < ApplicationRecord
  has_many :comment
  has_rich_text :content
  
  belongs_to :category
  belongs_to :user

  validates :category, :title, :content, :user, presence: true
  validates :title, uniqueness: true
end
