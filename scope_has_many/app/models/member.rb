class Member < ActiveRecord::Base
  belongs_to :project
  belongs_to :person

  scope :lead,   -> { where(is_lead: true) }
end