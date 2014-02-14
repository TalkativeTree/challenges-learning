class Person < ActiveRecord::Base
  has_many :people_project
  has_many :projects, :through => :people_project
end