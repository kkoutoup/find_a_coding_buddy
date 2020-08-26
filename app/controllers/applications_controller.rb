class ApplicationsController < ApplicationController
  before_action :find_project, except: [:index]

  def index
    @applications = Application.where(user_id: current_user.id).order(id: :desc)
  end

  def show; end

  def new
    @application = Application.new
    @application.project = @project
    @application.user = current_user
    @application.status = false
    @application.save
    redirect_to profile_path(current_user)
  end

  def create
  end

  def destroy
    @application.destroy
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

end
