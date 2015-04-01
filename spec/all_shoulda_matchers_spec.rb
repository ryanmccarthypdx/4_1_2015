require 'rails_helper'

describe User do
  it { should have_many :messages }
  # it { should have_many :contacts }
end

describe Message do
  it { should belong_to :user }
  # it { should belong_to :contacts }
end
