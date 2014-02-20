class Programs < ActiveRecord::Base
  validates :code, length: { is: 6 }

  [:title, :subtitle, :code].each do |column|

    validates_presence_of column
    validates_format_of column, with: /\w/, message: "Only letters or numbers allowed."
  end
end
