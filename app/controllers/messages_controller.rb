class MessagesController < ApplicationController
  def new
    @contact = Contact.find_by(number: params['to'])
    @message = Message.new
    @contacts = Contact.all
    @formatted_contacts = []
    @contacts.each do |contact|
      individual_formatted_contact = []
      individual_formatted_contact.push(contact.nickname)
      individual_formatted_contact.push(contact.id)
      @formatted_contacts.push(individual_formatted_contact)
    end

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
