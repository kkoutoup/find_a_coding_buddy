class ChatroomsController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @chatroom = @project.chatroom
    @message = Message.new()
  end

end
