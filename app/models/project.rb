class Project < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :reviews
  has_many :chatrooms
  has_many :messages, through: :chatrooms
end
