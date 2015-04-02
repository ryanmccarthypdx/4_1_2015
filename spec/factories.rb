FactoryGirl.define do
  factory :user do
    email 'tester@testee.com'
    password 'testtest'
  end

  factory :contact do
    nickname 'testington'
    number '1112223333'
  end
end
