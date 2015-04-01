require 'rails_helper'

describe "the contact-related functionality" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "creates a contact successfully" do
    visit user_path(user)
    fill_in "Nickname", :with => "Chris-topher Joy Webb"
    fill_in "Number", :with => "503-555-1212"
    click_on "Create Contact"
    expect(page).to have_content "Chris-toper Joy Webb" && "uccess"
  end


end