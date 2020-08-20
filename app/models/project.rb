class Project < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :users, through: :teams
  has_many :reviews
  has_one :chatroom
  has_many :messages, through: :chatroom
  has_many :project_technologies
  has_many :technologies, through: :project_technologies
  validates :title, :description, :duration, :difficulty, presence: true
  validates :title, length: { in: 20..50 }
  validates :description, length: { in: 150..500 }
  validates :duration,  numericality: { only_integer: true }
end
