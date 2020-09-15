class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.includes([:technologies]).all.sample(9)
    @technologiesRoundedDown = (Technology.count / 5).round * 5
    @projectsRoundedDown = (Project.count / 5).round * 5
    @usersRoundedDown = (User.count / 5).round * 5
    @users = User.includes([:technologies]).with_attached_photo.all.sample(6)
    # @technology_ids = @project.technologies.ids
  end

  def show
    @project = Project.find(params[:id])
    @technology_ids = @project.technologies.ids
    @photo = Photo.where(project_technologies: { technology_id: [@technology_ids] }).distinct
    # line 16 if we can have a photo model
  end

end


