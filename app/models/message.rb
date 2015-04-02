class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact

  before_create :send_message

  # def initialize
  #   @contact_id = Contact.find_by(:number => attributes['to'])
  #   @user_id = attributes.user_id
  #   @body = attributes['body']
  # end

# private
  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end

end
