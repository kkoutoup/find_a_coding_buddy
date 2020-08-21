class Project < ApplicationRecord
  belongs_to :user
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams
  has_many :reviews, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_many :messages, through: :chatroom
  has_many :project_technologies, dependent: :destroy
  has_many :technologies, through: :project_technologies
  validates :title, :description, :duration, :difficulty, presence: true
  validates :title, length: { in: 10..50 }
  validates :description, length: { in: 20..500 }
  validates :duration,  numericality: { only_integer: true }
end
