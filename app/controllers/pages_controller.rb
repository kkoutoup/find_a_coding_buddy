class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.all
    @technologiesRoundedDown = (Technology.count / 5).round * 5
    @projectsRoundedDown = (Project.count / 5).round * 5
    @usersRoundedDown = (User.count / 5).round * 5
  end
end


