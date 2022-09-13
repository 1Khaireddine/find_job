class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  scope :is_archived, -> { where(is_archived: true) }
  enum :role, { admin: 0, technician: 1 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def short_name
    "#{first_name.first}. #{last_name}"
  end
end
