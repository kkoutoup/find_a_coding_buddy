class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to # TO DECIDE , projects_path MAYBE?
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.where(id: @project.id)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

end

