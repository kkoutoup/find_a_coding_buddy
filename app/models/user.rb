class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teams
  has_many :projects
  has_many :messages
  has_many :member_projects, through: :teams, source: :project
  has_many :reviews
  has_many :user_technologies
  has_many :technologies, through: :user_technologies
  validates :first_name, :last_name, presence:true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :personal_summary, length: { in: 50..600 }
  # remember to add address validation
end