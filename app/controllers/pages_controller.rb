class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.all.sample(9)
    @technologiesRoundedDown = (Technology.count / 5).round * 5
    @projectsRoundedDown = (Project.count / 5).round * 5
    @usersRoundedDown = (User.count / 5).round * 5
    @users = User.all.sample(6)
    # @technology_ids = @project.technologies.ids
  end
end


