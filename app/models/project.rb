class Project < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :users, through: :teams
  has_many :reviews
  has_many :chatrooms
  has_many :messages, through: :chatrooms
  has_many :project_technologies
  has_many :technologies, through: :project_technologies
end
