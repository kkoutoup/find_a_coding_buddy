class ApplicationsController < ApplicationController
  before_action :find_project, except: [:index]

  def index
    @applications = Application.where(user_id: current_user.id).order(id: :desc)
  end

  def show; end

  def new
    @application = Application.new(find_project)
  end

  def create
    @application = Application.new(find_project)
    @application.project = @project
    @application.user = current_user
    if @application.save
      @application.update_attributes(status: nil)
      redirect_to # project_bookings_path(current_user) TO UPDATE
    else
      render :new 
  end

  def destroy
    @application.destroy
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

end
