class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @users = User.with_attached_photo.search_by_name_address_and_technologies(params[:query])
    elsif params.has_key?(:first_name)
      @users = User.with_attached_photo.where(first_name: params[:first_name])
    elsif params.has_key?(:address)
      @users = User.with_attached_photo.where(address: params[:address])
    elsif params.has_key?(:expertise_level)
      @users = User.with_attached_photo.where(expertise_level: params[:expertise_level])
    elsif params.has_key?(:technologies)
      @users = User.with_attached_photo.where(technologies: params[:technologies])
    else
      @users = User.with_attached_photo.all
    end
  end

  def show; end

  def edit; end

  def update
    @user.update(strong_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def profile
    @projects = current_user.projects
    @user = current_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def strong_params
    params.require(:user).permit(:address, :available, :email, :expertise_level, :first_name, :last_name, :personal_summary, :photo, technology_ids: [] )
  end
end
