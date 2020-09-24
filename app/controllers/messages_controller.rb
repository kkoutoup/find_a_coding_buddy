class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id]) 
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @project = @chatroom.project
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message, author_id: current_user.id  })
      )
      respond_to do |format|
        format.html { redirect_to project_chatroom_path( @project, anchor: "message-#{@message.id}") }
        format.js
      end

    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
