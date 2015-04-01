require 'rails_helper'

def sign_in(user)
  visit '/'
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
