class Account
  include ActiveRecord::Model

  has_many :characters

  validate :name, present: true
  validate :email, present: true, uniqueness: true
end
