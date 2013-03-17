class Place
  include ActiveRecord::Model

  has_many :characters

  validate :name, present: true
  validate :description, present: true
end
