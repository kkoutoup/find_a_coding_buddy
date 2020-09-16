class Application < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :user_id, uniqueness: { scope: :project_id }

  def accepted?
    status
  end

  def rejected?
    !status && !status.nil?
  end

  def pending?
    status.nil?
  end

end
