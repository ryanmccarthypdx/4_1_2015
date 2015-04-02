class MessagesController < ApplicationController
  def new
    @contact = Contact.find_by(number: params['to'])
    @message = Message.new
    
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.send_message
      @message.save
      flash[:notice] = 'Message sent'
      redirect_to authenticated_root_path
    else
      flash[:alert] = 'Message not sent'
      render :new
    end
  end

private
  def message_params
    params.require(:message).permit(:user_id, :contact_id, :body)
  end
end
