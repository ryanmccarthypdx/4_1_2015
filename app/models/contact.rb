class Contact < ActiveRecord::Base

  belongs_to :user
  has_many :messages

  validates :number, :presence => true
  validates :nickname, :presence => true

end
