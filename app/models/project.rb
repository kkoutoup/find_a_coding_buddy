class Project < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :users, through: :teams
  has_many :reviews
  has_one :chatroom
  has_many :messages, through: :chatroom
  has_many :project_technologies
  has_many :technologies, through: :project_technologies
end
