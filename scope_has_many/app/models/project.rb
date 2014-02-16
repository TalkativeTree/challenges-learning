class Project < ActiveRecord::Base
  has_many :members
  has_many :people, :through => :members
end

