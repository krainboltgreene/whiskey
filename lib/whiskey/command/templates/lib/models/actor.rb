class Actor < ActiveRecord::Base

  belongs_to :account

  validate :name, present: true
  validate :description, present: true
end
