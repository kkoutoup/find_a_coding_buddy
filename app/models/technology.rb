class Technology < ApplicationRecord
  has_many :projects, through: :project_technologies
  has_many :users, through: :user_technologies
  validates :name, presence: true
  has_one_attached :photo
end
