class UsersController < ApplicationController
  def show
    @user = current_user
    @contact = Contact.new
    @contacts = Contact.all
  end
end
