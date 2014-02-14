class Project < ActiveRecord::Base
  has_many :people_project
  has_many :people, :through => :people_project
end

