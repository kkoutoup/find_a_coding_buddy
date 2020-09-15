class ApplicationsController < ApplicationController
  before_action :find_project, only: [:show, :create, :destroy, :new]

  def index
    @applications = Application.where(user_id: current_user.id).order(id: :desc)
  end

  def show; end

  def new
    @application = Application.new
    @application.project = @project
    @application.user = current_user
    @application.status = nil
    @application.save
    redirect_to profile_path
  end

  def create
  end

  def destroy
    @application.destroy
  end

  def accept
    @application = Application.find(params[:id])
    @application.status = true
    @application.save
    redirect_back(fallback_location: root_path)
  end

  def reject
    @application = Application.find(params[:id])
    @application.status = false
    @application.save
    redirect_back(fallback_location: root_path)
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  # def strong_params
  #   params.require(:application).permit(:message) #add migration
  # end

end
