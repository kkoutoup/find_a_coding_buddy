class UsersController < ApplicationController

    def index
      if params[:query].present?
        @users = User.search_by_name_address_and_technologies(params[:query])
      elsif params.has_key?(:first_name)
        @users = User.where(first_name: params[:first_name])
      elsif params.has_key?(:address)
        @users = User.where(address: params[:address])
      elsif params.has_key?(:expertise_level)
        @users = User.where(expertise_level: params[:expertise_level])
      elsif params.has_key?(:technologies)
        @users = User.where(technologies: params[:technologies])
      else
        @users = User.all
      end
    end


  def show
    @user = User.find(params[:id])
  end

  def profile
    @projects = current_user.projects
  end
end
