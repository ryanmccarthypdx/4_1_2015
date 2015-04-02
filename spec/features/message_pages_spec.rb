require "rails_helper"

describe Message do
  let(:user) { FactoryGirl.create(:user) }
  let(:contact) { FactoryGirl.create(:contact)}

  before do
    sign_in(user)
  end

  it "brings up the send message form when you click on a nickname" do
    FactoryGirl.create(:contact, :user_id => user.id )
    visit user_path(user)
    click_on "New Message"
    expect(page).to have_content "Contact" && "User" && "Body"
  end

end
