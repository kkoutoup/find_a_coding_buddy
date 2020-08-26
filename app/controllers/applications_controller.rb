class ApplicationsController < ApplicationController
  before_action :find_project, except: [:index]

  def index
    @applications = Application.where(user_id: current_user.id).order(id: :desc)
  end

  def show; end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new
    @application.project = @project
    @application.user = current_user
    if @application.save
      @application.update_attributes(status: nil)
      redirect_to project_bookings_path(current_user)
    else
      render :new 
    end
  end

  def destroy
    @application.destroy
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

end
