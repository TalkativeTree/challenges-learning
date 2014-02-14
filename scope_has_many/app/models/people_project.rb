class PeopleProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :person

  scope :lead,   -> { where(is_lead: true) }
  scope :member, -> { where(is_lead: false)}
end