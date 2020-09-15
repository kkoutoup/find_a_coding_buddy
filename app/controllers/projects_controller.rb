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
      Chatroom.create(project_id: @project.id)
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
    if params[:query].present?
      @projects = Project.includes([:technologies]).search_by_title_and_description(params[:query])
    elsif params.has_key?(:difficulty)
      @projects = Project.includes([:technologies]).where(difficulty: params[:difficulty])
    elsif params.has_key?(:created_at)
      if params[:created_at] == "most_recent"
        @projects = Project.includes([:technologies]).order("projects.created_at DESC")
      else
        @projects = Project.includes([:technologies]).order("projects.created_at ASC")
      end
    else
      @projects = Project.includes([:technologies]).all
    end
  end

  def show
    @technology_ids = @project.technologies.ids
    @related_projects = Project.where.not(id: @project.id).joins(:project_technologies).where(project_technologies: { technology_id: [@technology_ids] }).distinct
    @application = Application.new
    if user_signed_in?
      @applications = Application.where(project_id: @project.id, user_id: current_user.id).where.not(status: nil).first
    end
    @project_reviews = Review.where(project_id: @project.id)
  end

  def toggle_status
    @project = Project.find(params[:id])
    @project.update(status: !@project.status)
    redirect_to project_path(@project)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def strong_params
    params.require(:project).permit(:title, :description, :rich_content, :document, :difficulty, :duration, technology_ids: [] )
  end
end
