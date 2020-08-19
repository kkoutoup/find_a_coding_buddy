class Technology < ApplicationRecord
  has_many :projects, through: :project_technologies
  has_many :users, through: :user_technologies
end
