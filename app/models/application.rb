class Application < ApplicationRecord
  belongs_to :project
  belongs_to :user

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
