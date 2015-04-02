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

  it "throws errors if no nickname is entered" do
    visit user_path(user)
    fill_in "Number", :with => "503-555-1212"
    click_on "Create Contact"
    expect(page).to have_no_content "503-555-1212" || "uccess"
  end

  it "throws errors if no number is entered" do
    visit user_path(user)
    fill_in "Nickname", :with => "Chris-topher Joy Webb"
    click_on "Create Contact"
    expect(page).to have_no_content "Chris-toper Joy Webb" || "uccess"
  end

  it "deletes a contact" do
    contact = FactoryGirl.create(:contact)
    visit authenticated_root_path
    click_on 'delete'
    expect(page).to have_content 'demolished'
    expect(page).to have_no_content 'testington'
  end

  it "edits a contact" do
    contact = FactoryGirl.create(:contact)
    visit authenticated_root_path
    click_on 'edit'
    fill_in "Nickname", :with => "totesmcgoats"
    click_on "Update Contact"
    expect(page).to have_content 'updated' && "totesmcgoats"
  end
end
