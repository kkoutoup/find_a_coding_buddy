class UserTechnology < ApplicationRecord
  belongs_to :technology
  belongs_to :user
end
