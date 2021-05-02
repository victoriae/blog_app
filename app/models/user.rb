class User < ApplicationRecord
  has_many :article
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[admin editor], _default: :editor

  validates :email, presence: true
  validates :email, uniqueness: true
end
