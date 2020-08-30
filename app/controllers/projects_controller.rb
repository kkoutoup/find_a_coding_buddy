class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(strong_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    @project.update(strong_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  def index
    @projects = Project.all
  end

  def show
    @technology_ids = @project.technologies.ids
    @related_projects = Project.where.not(id: @project.id).joins(:project_technologies).where(project_technologies: { technology_id: [@technology_ids] }).distinct
    @application = Application.new
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def strong_params
    params.require(:project).permit(:title, :description, :difficulty, :duration)
  end

end

