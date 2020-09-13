class ReviewsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @project_owner = User.find(@project.user_id)
    @user = current_user
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @project = Project.find(params[:project_id])
    @review.project = @project
    @project_owner = User.find(@project.user_id)
    if @review.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
