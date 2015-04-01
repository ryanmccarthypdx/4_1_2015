require 'rails_helper'

describe "the sign in process" do
  it "will sign in just fine" do
    FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', with: 'tester@testee.com'
    fill_in 'Password', with: 'testtest'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "throw errors for messups" do
    FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', with: 'tester@tester.com'
    fill_in 'Password', with: 'testtest'
    click_on 'Log in'
    expect(page).to have_content 'Invalid email'
  end

  it "will redirect to the user's page when the login is successful" do
    FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', with: 'tester@testee.com'
    fill_in 'Password', with: 'testtest'
    click_on 'Log in'
    expect(page).to have_content 'You are currently logged in as: tester@testee.com'
  end






end
