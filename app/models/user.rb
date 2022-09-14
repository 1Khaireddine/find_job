class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  scope :is_archived, -> { where(is_archived: true) }
  enum :gender, { male: 0, female: 1 }
  enum :role, { admin: 0, technician: 1 }

  ## Avatar Attachment
  has_one_attached :avatar

  ## Validations
  validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  def full_name
    "#{first_name} #{last_name}"
  end

  def short_name
    "#{first_name.first}. #{last_name}"
  end
end
