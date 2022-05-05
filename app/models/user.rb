class User < ApplicationRecord
  after_create :set_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, dependent: :destroy, foreign_key: :author_id
  has_many :categories, dependent: :destroy, foreign_key: :author_id
  
  validates :name, presence: true, length: { maximum: 20 }

  private

  def set_role
    update(role: 'user')
  end
end
