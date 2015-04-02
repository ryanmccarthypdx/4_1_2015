FactoryGirl.define do
  factory :user do
    email 'tester@testee.com'
    password 'testtest'
  end

  factory :contact do
    nickname 'Lee Jorgensen'
    number '7073371418'
  end
end
