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
  # validates :personal_summary, length: { in: 20..1200 }
  # validates :expertise_level, inclusion: { in: ["beginner", "intermediate", "advanced"] }
  # remember to add address validation
end
