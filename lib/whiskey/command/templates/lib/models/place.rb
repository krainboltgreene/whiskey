class Place < ActiveRecord::Base
  has_many :characters

  validate :name, present: true
  validate :description, present: true
end
