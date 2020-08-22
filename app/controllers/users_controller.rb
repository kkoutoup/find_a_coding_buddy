class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.where(user:current_user)
  end
end
