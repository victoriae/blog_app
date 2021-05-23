class Article < ApplicationRecord
  has_many :comment
  has_rich_text :content
  
  belongs_to :category
  belongs_to :user

  validates :category, :title, :content, :user, presence: true
  validates :title, uniqueness: true

  filterrific(
    available_filters: %i[with_category_id with_user_id]
  )

  scope :with_category_id, ->(categories) {
    where(category: categories)
  }

  scope :with_user_id, ->(users) {
    where(user: users)
  }
end
