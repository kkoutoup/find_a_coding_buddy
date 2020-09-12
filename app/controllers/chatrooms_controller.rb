class ChatroomsController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new()
  end

end
