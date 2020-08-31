require 'rounding'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.all
    @technologiesRoundedDown = Technology.count.floor_to(5)
    @projectsRoundedDown = Project.count.floor_to(5)
    @usersRoundedDown = User.count.floor_to(5)
  end
end
