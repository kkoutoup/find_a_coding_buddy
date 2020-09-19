class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :applications, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :member_projects, through: :applications, source: :project
  has_many :reviews, dependent: :destroy
  has_many :user_technologies, dependent: :destroy
  has_many :technologies, through: :user_technologies
  validates :first_name, :last_name, presence:true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :personal_summary, length: {maximum: 255}
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_address_and_technologies,
    against: [ :first_name, :address, :expertise_level ],
    associated_against: {
      technologies: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

# NOTE TO BUDDIES: need to add address, expertise_level and techonology to the user
